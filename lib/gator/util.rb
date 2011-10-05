require "thor"
require "thor/util"
require "thor/actions"
require "pathname"

class Gator
  module Sandbox
    def self.gator
      Gator.application
    end
  end
  class Util

    def self.initialize_files

      if File.exists? gator_config
        load_rubyfile gator_config
      else
        ConfigFileCreator.new.config_file
      end

      p_file = find_gator_project_file
      load_rubyfile p_file unless p_file.nil?

    end

  end
end