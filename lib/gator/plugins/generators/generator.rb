class Gator
  class Generator < Task
    def init
    end
  end
  module ActAsTemplateGenerator

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods

      def template_root
        nil
      end

      def source_paths
        unless @template_roots
          @template_roots = []
          @template_roots += Gator::Project.project.template_roots if Gator::Project.project
          @template_roots << Gator::Util.generator_template_root
          @template_roots << template_root if template_root
        end
        @template_roots
      end

    end

  end
end