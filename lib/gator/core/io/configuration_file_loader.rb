class Gator
  class ConfigurationFileLoader

    def config_file
      File.join(Gator::Paths.gator_home, "configuration.rb")
    end

  end
end
