module Gator

  module ActAsCommand

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods

      attr_reader :definition, :parent

      def define(definition)
        @definition = definition
      end

      def parent_command=(klass)
        @parent = klass
      end

    end

    def parent
      self.class.parent
    end

    def get_subcommand(*args)
      nil
    end

  end

  module ActAsCommandCollection

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods

      def subcommand_classes
        @subcommand_classes ||= {}
      end

      def register_subcommand(klass)
        d = klass.definition
        register klass, d[:command], d[:usage], d[:description], d[:options] || {}
        map [d[:short]] => d[:command] unless d[:short].nil?
        subcommand_classes[d[:command]] = klass
        klass.parent_command = self
      end

      def get_subcommand(*args)
        arg = args.shift
        klass = subcommand_classes[arg.to_s]
        until args.empty? do
          arg = args.shift
          klass = klass.subcommand_classes[arg]
        end
        klass
      end

    end

  end

  class Command < Thor
    include ActAsCommand
    include ActAsCommandCollection

      #The following lines fix a bug in thor see: https://github.com/wycats/thor/pull/150
    class << self
      def register(klass, subcommand_name, usage, description, options={})
        if klass <= Thor::Group
          desc usage, description, options
          define_method(subcommand_name) { |*args| invoke klass }
        else
          desc usage, description, options
          subcommand subcommand_name, klass
        end
      end
    end

  end
end