module Gator
  module Project

    class Base

      attr_reader :name

      def initialize(name)
        @name = name
        @layout = Layout.default
      end

      def path(*args)
        File.join(Gator::Project.project_dir, layout.expand(*args))
      end

      def layout
        @layout
      end

      def layout=(layout)
        @layout= layout
      end

    end

    class << self

      def project=(project)
        @project = project
      end

      def project
        @project
      end

      def is_project_directory(path= Dir.getwd)
        File.exists? File.join(path, relative_project_file)
      end

      def is_project_subdirectory(path= Dir.getwd)
        !get_project_directory_of_subdirectory(path).nil?
      end

      def get_project_directory_of_subdirectory(path= Dir.getwd)
        original_dir = Dir.getwd
        here = path
        Dir.chdir(here)
        while !(is_project_directory(Dir.getwd))
          Dir.chdir("..")
          return nil if Dir.pwd == here
          here = Dir.pwd
        end
        return here
      ensure
        Dir.chdir(original_dir)
      end

      def project_file(path= Dir.getwd)
        if is_project_directory(path)
          File.join(path, relative_project_file)
        elsif is_project_subdirectory(path)
          File.join(get_project_directory_of_subdirectory, relative_project_file)
        else
          nil
        end
      end

      def project_dir(path= Dir.getwd)
        File.dirname( File.dirname( project_file(path) ))
      end

      private

      def relative_project_file
        File.join(".gator", "project.rb")
      end
    end

    def project(project=nil)
      Gator::Project.project= project unless project.nil?
      load_project unless Gator::Project.project
      if Gator::Project.project.nil?
        Gator.shell.say "Project is not defined!\nMake sure to define a project in #{Gator::Project.project_file}",:red
        raise "ProjectNotDefined"
      end
      Gator::Project.project
    end

#    def define_project(project)
#      Gator::Project.project= project
#    end

    def load_project
      pfile = Gator::Project.project_file
      if pfile.nil?
        Gator.shell.say "This is not a project directory!\nPlease create a gator project first.", :red
        raise "NotInsideProjectDirectory"
      else
        load pfile
      end
    end

#    def define_project( project )
#      @project = project
#    end

#    def project
#      p "project"
#      load_project unless @project
#      p " @project=#{@project}"
#      if @project.nil?
#        Gator.shell.say "Project is not defined!\nMake sure to define a project in #{Gator::Project.project_file}",:red
#        raise "ProjectNotDefined"
#      end
#      p " @project=#{@project}"
#      @project
#    end

#    private

#    def load_project
#      load File.join(".gator","project.rb")
#      p 'load_project'
#      pfile = Gator::Project.project_file
#      if pfile.nil?
#        Gator.shell.say "This is not a project directory!\nPlease create a gator project first.", :red
#        raise "NotInsideProjectDirectory"
#      else
#        load pfile
#      end
#    end

  end
end