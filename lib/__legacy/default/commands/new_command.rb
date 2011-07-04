require "thor/actions"

module Gator
  module Default
    module Commands

      class NewCommand < Gator::Command::Base
        include Thor::Actions

        specify "new", "n"

        def self.source_root
          File.dirname(__FILE__)
        end

        argument :name, :type => :string, :desc => "The name of the project."
        desc "Creates an empty gator project."

        def create
          directory "new_template", name
          # we need to call directories starting with a . seperately
          directory "new_template/.gator", "#{name}/.gator"
        end

      end

      Gator::Command.add NewCommand

    end
  end
end