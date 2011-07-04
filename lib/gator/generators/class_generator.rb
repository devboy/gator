require "gator/generator"

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
      template "Class.as.tt", File.join( src, "#{class_name}.as")
    end
  end
end