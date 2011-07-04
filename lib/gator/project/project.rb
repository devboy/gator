require File.dirname(__FILE__) + '/../util'
require File.dirname(__FILE__) + '/layout'
module Gator
  module Project

    def self.project
      @project
    end

    def self.project=(project)
      @project = project
    end

    def project( project= nil )
      Project.project = project unless project.nil?
      Project.project
    end

    class ProjectBase

      attr_accessor :name, :layout

      def initialize
        @name = ""
        @layout = Layout.default
      end

      def path(*args)
        File.join(Gator::Util.find_gator_project, layout.expand(*args))
      end

      def options
        @options ||= {}
      end

    end

  end
end