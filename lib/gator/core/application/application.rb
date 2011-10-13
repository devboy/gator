require 'singleton'

class Gator
  class Application < Command

    define :command => "gator"

    include Thor::Actions

    desc "version", "Show Gator version"
    def version
      version_file = File.dirname(__FILE__) + '/../../../../VERSION'
      say File.exist?(version_file) ? File.read(version_file) : ""
    end

    def initialize(*args)
      bootstrap
      super
    end

    no_tasks {

      def bootstrap
        Gator::Sandbox.add_getter :gator, Gator::ApplicationConfiguration.new
        load_configuration
        load_project
      end

      def load_configuration
        file = Gator::Paths.env_file
        say "No environment file (env.rb) could be found in gator home directory.(#{Gator::Paths.gator_home})", :yellow unless File.exist? file
        RubyFileLoader.new(Gator::Sandbox).exec_file file if File.exist? file
      end

      def load_project
        file = Gator::Paths.project_file
        say "No project file (gator.rb) could be found in this directory.(#{Dir.pwd})", :yellow if file.nil?
        RubyFileLoader.new(Gator::Sandbox).exec_file file unless file.nil?
      end

    }
  end
end