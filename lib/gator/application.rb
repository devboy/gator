class Gator

  class Application

    def run
      Gator::Runner.start
    end

    def configuration
      @configuration ||= GatorConfiguration.new
    end

  end

end