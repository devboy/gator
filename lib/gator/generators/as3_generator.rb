require "gator/generator"
require "gator/project"

module Gator
  class AS3Generator < Gator::Generator
    include Thor::Actions
    include Gator::Project

    register_generator "as3", "generate as3 CLASS_NAME", "Creates a class."

    def self.source_root
      File.dirname __FILE__
    end

    desc "as3 klass CLASS_NAME", "Creates an AS3 Class"
    def klass(class_name)
      src = project.path(:src,:main,:as3)
      @package_name, @class_name = split_class_name(class_name)
      src = File.join( src, @package_name.split(".").join(File::SEPARATOR) ) unless @package_name == ""
      template "ClassTemplate.as.tt", File.join( src, "#{@class_name}.as")
    end

    no_tasks {

      def package_name
        @package_name
      end

      def class_name
        @class_name
      end

    }

    protected

    def split_class_name(class_name)
      pieces = class_name.split "."
      class_name = pieces.pop
      package_name = pieces.join "."
      return package_name, class_name
    end

  end
end