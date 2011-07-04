module Gator
  module Command

    class << self

      def add(command)
        unless will_collide? command
          commands.push(command)
          return true
        end
        false
      end

      def remove(command)
        commands.delete(command) != nil?
      end

      def has?(name_or_alias)
        commands.any? { |command| command.command_name == name_or_alias || command.command_alias == name_or_alias }
      end

      def get(name_or_alias)
        commands.detect { |command| command.command_name == name_or_alias || command.command_alias == name_or_alias }
      end

      protected

      def commands
        @commands ||= []
      end

      def will_collide?(command)
        has?(command.command_name) || has?(command.command_alias)
      end

    end

    class Base < Thor::Group

      class << self
        attr_reader :command_name, :command_alias

        def specify( command_name, command_alias )
          @command_name, @command_alias = command_name, command_alias
        end
      end

    end
  end
end