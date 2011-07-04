require "thor/actions"
module Gator
  module AS3
    class AS3ClassGenerator < Gator::Generators::Base
      include Gator::ProjectCommand, Thor::Actions

      specify "as3class", "as3c"

      argument :package_name, :type => :string, :desc => "The name of the package."
      argument :class_name, :type => :string, :desc => "The name of the class."
      desc "Creates an ActionScript3 Class"

      def self.source_root
        File.dirname(__FILE__)
      end

      def create_class
        src = project.path(:source, :main, :as3)
        template "AS3ClassTemplate.as.tt", File.join(src, "#{class_name}.as" )
      end

    end

    Gator::Generators.add AS3ClassGenerator
  end
end

