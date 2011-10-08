class Gator
  require 'pathname'
  class ProjectFileLoader < RubyFileLoader

    def load_file path=Dir.getwd
      file = find_project_file path
      exec_file file unless file.nil?
      self
    end

    private

    def project_files
      ["gator", "gator.rb"]
    end

    def project_file_paths dir
      project_files.collect { |f| File.join(dir, f) }
    end

    def find_project_dir path=Dir.getwd
      file = find_project_file path
      File.dirname file unless file.nil?
    end

    def find_project_file path=Dir.getwd
      gatorfile = nil
      Pathname.new(path).ascend do |dir|
        gatorfile = project_file_paths(dir).map { |g| Dir[g] }.flatten.first
        break unless gatorfile.nil? || File.directory?(gatorfile)
      end
      gatorfile
    end

  end
end