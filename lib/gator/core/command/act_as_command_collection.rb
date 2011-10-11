class Gator
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

      alias :<< :register_subcommand


      def get_subcommand(*args)
        klass = self
        args.each do |arg|
          return nil unless klass.subcommand_classes.has_key? arg
          klass = klass.subcommand_classes[arg]
        end
        klass
      end

      def resolve_subcommand(command, fallback=nil)

        subcommand = get_subcommand *command
        return subcommand unless subcommand.nil?

        if command.respond_to?(:first) && command.first == definition[:command]
          command_stripped = command.dup
          command_stripped.shift
          subcommand = command_stripped.empty? ? self : get_subcommand(*command_stripped)
          return subcommand unless subcommand.nil?
        end

        subcommand = parent.resolve_subcommand command unless parent.nil?
        return subcommand unless subcommand.nil?

        resolve_subcommand fallback unless fallback.nil?
      end

    end

    def get_subcommand(*args)
      self.class.get_subcommand *args
    end

    def resolve_subcommand(command, fallback=nil)
      self.class.resolve_subcommand command, fallback
    end

  end
end