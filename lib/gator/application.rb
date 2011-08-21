module Gator

  class << self
    @@application = nil
    def application
      @@application ||= Application.new
    end
  end

  class GatorConfiguration
    include Gator::Configuration::ActAsConfiguration

    def initialize
      add_configuration :project, Gator::Project::Base.new
    end

  end

  class Application

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