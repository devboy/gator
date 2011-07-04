require "thor"
require "thor/actions"
require "fileutils"
require File.dirname(__FILE__) + '/util'
require File.dirname(__FILE__) + '/command'

module Gator
  class Project < Command
    include Thor::Actions

    register_command "project", "project TASK", "Set of tasks to manage project templates.", [:p]

    def self.source_root
      Gator::Util.project_template_root
    end

    desc "project install DIRECTORY TEMPLATE_NAME", "Install a project template."
    def install( dir, template=nil )
      entries = directory_entries dir
      template ||= File.expand_path( File.dirname(entries.first) ).split(File::SEPARATOR).last
      empty_directory template_dir(template)
      FileUtils.cp_r entries, template_dir(template)
    end

    desc "project uninstall TEMPLATE_NAME", "Uninstall a project template."
    def uninstall( template )
      FileUtils.rm_r template_dir(template)
    end

    desc "project new DIRECTORY TEMPLATE_NAME", "Create a new project by template."
    def new( dir, template )
      directory template_dir(template), File.expand_path( dir )
    end

    desc "project wipe", "Delete all project templates."
    def wipe
      template_root_entries.each { |e| FileUtils.rm_r e }
    end

    desc "project list [SEARCH]", "Lists project templates."
    def list(search=nil)
      entries = template_root_entries
      entries = entries.select { |e| e.include?(search) } unless search.nil?
      entries.each {|e| say "  #{e}" }
      say "No templates found.", :blue if entries.empty?
    end

    private

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

    def template_root_entries
      directory_entries Gator::Util.project_template_root, false
    end

  end
end