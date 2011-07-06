require 'thor'
require 'thor/group'
require 'thor/actions'

module Gator
  class Runner < Thor
    include Thor::Actions

    def self.start
      Gator::Util.initialize_files
      super
    end

    desc "version", "Show Gator version"
    def version
      say "Gator --pre"
    end

    #The following lines fixes a bug in thor see: https://github.com/wycats/thor/pull/150
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