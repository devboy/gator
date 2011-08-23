require 'singleton'

module Gator

  class GatorConfiguration
    include Gator::Configuration::ActAsConfiguration

    def initialize
      add_configuration :project, Gator::Project::Base.new
    end

  end

  def self.application
    Application.instance()
  end

  class Application
    include Singleton

    def initialize
      Gator::Util.initialize_files
    end

    def run
      Gator::Runner.start
    end

    def configuration
      @configuration ||= GatorConfiguration.new
    end

  end
end