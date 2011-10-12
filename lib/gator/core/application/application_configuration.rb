class Gator
  class ApplicationConfiguration < Configuration

    def initialize
      add_configuration :project, Gator::Project.new
      add_configuration :environment, Gator::Configuration.new
      add_configuration :env, @environment
    end

  end
end