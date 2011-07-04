require "thor"
require "fileutils"
require File.dirname(__FILE__) + '/util'

module Gator
  class Project < Thor
    include Thor::Actions

    def self.source_root
      Gator::Util.project_template_root
    end

    desc "project install DIRECTORY TEMPLATE_NAME", "Install a project template."
    def install( dir, template )
      empty_directory template_dir(template)
      FileUtils.cp_r File.expand_path( dir ), template_dir(template)
    end

    desc "project uninstall TEMPLATE_NAME", "Uninstall a project template."
    def uninstall( template )
      FileUtils.rm_r template_dir(template)
    end

    desc "project new DIRECTORY TEMPLATE_NAME", "Create a new project by template."
    def new( dir, template )
      directory template_dir(template), File.expand_path( dir )
    end

    private

    def template_dir( template )
      File.join( Gator::Util.project_template_root, template )
    end

  end
end