require "thor"
require "thor/actions"
require "fileutils"
require "gator/command"
require "gator/config"

module Gator
  class ProjectCommand < Command
    include Thor::Actions
    include Gator::Configuration

    define :command => "project", :short => "p",
           :usage => "project TASK", :description => "Set of tasks to manage project templates."

    def self.source_root
      Gator::Util.project_template_root
    end

    desc "project install NAME TEMPLATE_NAME", "Install a project template."
    def install( dir, template=nil )
      entries = directory_entries dir
      template ||= File.expand_path( File.dirname(entries.first) ).split(File::SEPARATOR).last
      empty_directory template_dir(template)
      FileUtils.cp_r entries, template_dir(template)
      create_empty_directory_files template_dir(template)
    end

    desc "project uninstall TEMPLATE_NAME", "Uninstall a project template."
    def uninstall( template )
      FileUtils.rm_r template_dir(template)
    end

    desc "project new NAME TEMPLATE_NAME", "Create a new project by template."
    def new( name, template )
      @project_name = name
      directory template_dir(template), File.expand_path( name )
    end

    desc "project wipe", "Delete all project templates."
    def wipe
      template_root_entries(true).each { |e| FileUtils.rm_r e }
    end

    desc "project list [SEARCH]", "Lists project templates."
    def list(search=nil)
      entries = template_root_entries
      entries = entries.select { |e| e.include?(search) } unless search.nil?
      entries.each {|e| say "  #{e}" }
      say "No templates found.", :blue if entries.empty?
    end

    no_tasks {

      def project_name
        @project_name
      end

      def configuration
        config
      end

    }

    private

    def create_empty_directory_files( dir )
      Dir.glob( File.join( dir, "**", "*" ) ).each {|f|
        create_file File.join(f,".empty_directory"), ".empty_directory" if File.directory?(f) && Dir.entries(f).length == 2
      }
    end

    def template_dir( template )
      File.join( Gator::Util.project_template_root, template )
    end

    def directory_entries( dir, join_with_dir=true )
      entries = Dir.entries(dir)
      entries.delete(".")
      entries.delete("..")
      entries.collect! { |e| File.join(dir, e) } if join_with_dir
      entries
    end

    def template_root_entries( join_with_dir=false )
      directory_entries Gator::Util.project_template_root, join_with_dir
    end

  end
end