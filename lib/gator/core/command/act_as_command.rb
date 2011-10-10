class Gator
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

    def definition
      self.class.definition
    end

    def get_subcommand(*args)
      nil
    end

    def resolve_subcommand(command, fallback=nil)
      return nil unless parent
      parent.resolve_subcommand(command, fallback)
    end

  end
end