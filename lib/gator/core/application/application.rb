class Gator
  class Application < Command
    include Thor::Actions

    def initialize(*args)
      bootstrap
      super
    end

    desc "version", "Show Gator version"

    def version
      version_file = File.dirname(__FILE__) + '/../../VERSION'
      say File.exist?(version_file) ? File.read(version_file) : ""
    end

    no_tasks {

      def bootstrap
        application = self
        Gator::Sandbox.class.send(:define_method, :gator) do
          application
        end
        load_configuration
        load_project
      end

      def load_configuration
        say "Configuration loading skipped."
      end

      def load_project

        puts "load_project", ProjectFileLoader.new(Gator::Sandbox).load_file
      end

    }
  end
end