class Gator

  class GatorConfiguration
    include Gator::Configuration::ActAsConfiguration

    def initialize
      add_configuration :project, Gator::Project::Base.new
    end

  end

  class Application

    def run
      Gator::Runner.start
    end

    def configuration
      @configuration ||= GatorConfiguration.new
    end

  end

  GATOR_APPLICATION = Gator::Application.new

  def self.application
    GATOR_APPLICATION
  end

end