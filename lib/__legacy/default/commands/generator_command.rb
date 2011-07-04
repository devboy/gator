module Gator
  module Generators
    class << self

      def add(generator)
        unless will_collide? generator
          generators.push(generator)
          return true
        end
        false
      end

      def remove(generator)
        generators.delete(generator) != nil?
      end

      def has?(name_or_alias)
        generators.any? { |generator| generator.generator_name == name_or_alias || generator.generator_alias == name_or_alias }
      end

      def get(name_or_alias)
        generators.detect { |generator| generator.generator_name == name_or_alias || generator.generator_alias == name_or_alias }
      end

      protected

      def generators
        @generators ||= []
      end

      def will_collide?(generator)
        has?(generator.generator_name) || has?(generator.generator_alias)
      end

    end

    class Base < Thor::Group

      class << self
        attr_reader :generator_name, :generator_alias

        def specify( generator_name, generator_alias )
          @generator_name, @generator_alias = generator_name, generator_alias
        end
      end

    end

    class GeneratorCommand < Gator::Command::Base
      include Thor::Actions

      specify "generate", "g"

      def self.source_root
        File.dirname(__FILE__)
      end

      argument :name, :type => :string, :desc => "The name of the generator."
#      argument :args, :type => :array
      desc "Finds and executes a generator."

      def find_and_execute
        raise "Generator: \"#{name}\" could not be found." unless Gator::Generators.has?(name)
        ARGV.shift
        ARGV << "--help" if ARGV.empty?

        Gator::Generators.get(name).start
      end

    end

    Gator::Command.add GeneratorCommand
  end
end