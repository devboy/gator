class Gator
  class Application < Command
    include Thor::Actions

    def initialize
      invoke :bootstrap
    end

    desc "version", "Show Gator version"
    def version
      version_file = File.dirname(__FILE__) + '/../../VERSION'
      say File.exist?(version_file) ? File.read(version_file) : ""
    end

    def bootstrap
      Gator::Sandbox.module_exec {
        def self.gator

        end
      }
      invoke :load_configuration
      invoke :load_project
    end

    def load_configuration

    end

    def load_project

    end

  end
end