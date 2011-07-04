require "thor/util"
module Gator
  class Util
    # Returns the root where thor files are located, dependending on the OS.
    #
    def self.gator_root
      File.join(Thor::Util.user_home, ".gator").gsub(/\\/, '/')
    end

    def self.project_template_root
      File.join(gator_root, "templates", "projects")
    end
  end
end