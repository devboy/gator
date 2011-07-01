module Gator

  class Application

    def initialize
      self
    end

    def execute( args )
      configuration.load_configuration
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def project
      @project
    end

    def project=( proj )
      @project= proj
    end

    def shell
      @shell ||= Shell.new
    end

  end

  class << self

    attr_accessor :application
    attr_accessor :base_dir

    def configuration
      application.configuration
    end

    def project
      application.project
    end

    def project=(proj)
      application.project= proj
    end

    def shell
      application.shell
    end

  end

  self.application= Application.new

end