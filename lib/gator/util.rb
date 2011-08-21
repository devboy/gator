require "thor"
require "thor/util"
require "thor/actions"
require "pathname"

module Gator
  module Sandbox
    def self.gator
      Gator.application.configuration
    end
  end
  class Util
    def self.gator_files
      ["gator", "gator.rb"]
    end

    def self.gator_files_for(dir)
      gator_files.collect { |f| File.join(dir, f) }
    end

    def self.gator_config
      File.join(gator_root, "configuration.rb")
    end

    def self.gator_root
      File.join(Thor::Util.user_home, ".gator").gsub(/\\/, '/')
    end

    def self.project_template_root
      File.join(gator_root, "templates", "projects")
    end

    def self.generator_template_root
      File.join(gator_root, "templates", "generators" )
    end

    def self.load_rubyfile(path, content=nil, debug=false)
      content ||= File.binread(path)

      begin
        Gator::Sandbox.module_eval(content, path)
      rescue Exception => e
        $stderr.puts "WARNING: unable to load file #{path.inspect}: #{e.message}"
        if debug
          $stderr.puts *e.backtrace
        else
          $stderr.puts e.backtrace.first
        end
      end
    end

    def self.find_gator_project_file(path= Dir.getwd)
      gatorfile = nil
      Pathname.new(path).ascend do |dir|
        gatorfile = gator_files_for(dir).map { |g| Dir[g] }.flatten.first
        break unless gatorfile.nil? || File.directory?(gatorfile)
      end
      gatorfile
    end

    def self.find_gator_project(path= Dir.getwd)
      file = find_gator_project_file path
      File.dirname file unless file.nil?
    end

    def self.initialize_files

      if File.exists? gator_config
        load_rubyfile gator_config
      else
        ConfigFileCreator.new.config_file
      end

      p_file = find_gator_project_file
      load_rubyfile p_file unless p_file.nil?

    end

    class ConfigFileCreator < Thor
      include Thor::Actions

      no_tasks {
        def config_file
          file = Gator::Util.gator_config
          user = ask "Username:"
          create_file file, "config.user='#{user}'"
        end
      }
    end

  end
end