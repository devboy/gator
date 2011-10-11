require 'singleton'

class Gator
  class Application < Command
    #include Singleton
    include Thor::Actions

    desc "version", "Show Gator version"
    def version
      version_file = File.dirname(__FILE__) + '/../../VERSION'
      say File.exist?(version_file) ? File.read(version_file) : ""
    end

    def initialize(*args)
      bootstrap
      super
    end

    no_tasks {

      def bootstrap
        Gator::Sandbox.add_getter :gator, self
        load_configuration
        load_project
      end

      def load_configuration
        say "Configuration loading skipped."
      end

      def load_project
        file = Gator::Paths.project_file
        RubyFileLoader.new(Gator::Sandbox).exec_file file unless file.nil?
      end

    }
  end
end