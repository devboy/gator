module Gator
  class Configuration

    def initialize
      @values = {}
      self
    end

    def load_configuration
      load_global_configuration
      load_project_configuration
    end

    def method_missing( sym, *args )
      if sym.to_s.end_with? "="
        @values[sym.to_s.gsub("=","")] = args.first unless args.empty?
      else
        @values[sym.to_s]
      end
    end

    protected

    def load_project_configuration
      config_file = File.find_file_upwards("gator_config.rb") || File.join( ".gator","gator_config.rb")
      ConfigurationGenerator.new.create_configuration config_file unless File.exists? config_file
      Gator.project.base_dir = File.dirname( File.dirname( config_file ) )
      load config_file
    end

    def load_global_configuration
      config_file = File.join( File.expand_path("~"),".gator","gator_config.rb")
      ConfigurationGenerator.new.create_configuration config_file, true unless File.exists? config_file
      load config_file
    end

  end

  #TODO: Refactor into gator default plugin
  class ConfigurationGenerator < Thor
    include Thor::Actions

    no_tasks {

     def create_configuration( config_file, global=false )
      Gator.shell.say "#{global ? "Global " : "Project "}configuration file not found in: #{config_file}!", :red
      Gator.shell.say "This is not a problem. Let's create one!", :green
      create_file config_file do
        render = ""
        render += "#This file has been generated by gator and wants to be edited by you!\n"
        if global
          render += "Gator.configuration.author=\"#{Gator.shell.ask "Author:"}\"\n"
        else
          render += "Gator.project = Gator::Project.new \"#{Gator.shell.ask "Project name:"}\"\n"
        end
        render
      end
     end

    }

  end

end

class File
  def self.find_file_upwards( file )
      original_dir = here = Dir.pwd
      while ! (File.file?(File.join(here,file)))
        Dir.chdir("..")
        return nil if Dir.pwd == here
        here = Dir.pwd
      end
      File.join(here,file)
    ensure
      Dir.chdir(original_dir)
    end
end