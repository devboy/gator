module Gator
  class Command < Thor

    def self.register_command(target, name, usage, description, mappings=[], options={})
      target.register self, name, usage, description, options
      target.map mappings => name
    end

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