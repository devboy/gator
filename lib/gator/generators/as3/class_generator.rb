module Gator
  module AS3
    class ClassGenerator < Generator
      include Gator::Project

      register_generator Gator::AS3::GeneratorCollection, "klass", "generate as3 klass CLASS_NAME", "Creates AS3 class."

      argument :name

      def self.source_root
        File.dirname __FILE__
      end

      def generate
        src = project.path(:src, :main, :as3)
        @package_name, @class_name = split_class_name(name)
        src = File.join(src, @package_name.split(".").join(File::SEPARATOR)) unless @package_name == ""
        template "ClassTemplate.as.tt", File.join(src, "#{@class_name}.as")

        invoke Gator::AS3::TestGeneratorCollection, "klass"
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
end