module Gator
  module Configuration

    def self.config
      @configuration ||= GatorConfiguration.new
    end

    def config
      Configuration.config
    end
    alias_method :configuration, :config

  end
  class GatorConfiguration

    attr_accessor :user

    def options
      @options ||= {}
    end

  end
end