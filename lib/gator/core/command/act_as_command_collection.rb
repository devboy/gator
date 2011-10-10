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

        parent_klass = self
        klass = parent_klass.get_subcommand *command

        return klass unless klass.nil?

        while parent_klass.parent
          parent_klass = parent_klass.parent
          klass = parent_klass.get_subcommand *command
          return klass unless klass.nil?
        end

        resolve_subcommand fallback if fallback
      end

    end

  end
end