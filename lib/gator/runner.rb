require 'thor'
require 'thor/group'
require File.dirname(__FILE__) + '/project'

module Gator
  class Runner < Thor
    namespace

    map "p" => :project

    def initialize(args=[], options={}, config={})
      super
    end


#    desc "project", "Project tasks"
#    def project
#
#    end

    desc "version", "Show Gator version"

    def version
      say "Gator --pre"
    end

  end
end

Gator::Runner.register Gator::Project, "project", "project usage", "project description"