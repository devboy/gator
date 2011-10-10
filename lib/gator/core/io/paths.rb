class Gator
  class Paths

    def self.gator_home
      File.join(Thor::Util.user_home, ".gator").gsub(/\\/, '/')
    end

    def self.project_home
      Gator::ProjectFileLocator.new.find_project_dir
    end

    def self.project_file
      Gator::ProjectFileLocator.new.find_project_file
    end

  end
end