module Gator
  class TemplateGenerator < Generator
    include Gator::Project

    class << self

      def template_root
        nil
      end

      def source_paths
        unless @template_roots
          @template_roots = []
          @template_roots << template_root if template_root
          @template_roots << Gator::Util.generator_template_root
          @template_roots += project.template_roots if project
        end
        @template_roots
      end

    end

  end
end