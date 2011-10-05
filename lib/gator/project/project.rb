class Gator
  module Project
    class Base
      include Gator::Configuration::ActAsConfiguration

      attr_accessor :name, :layout

      def initialize
        @name = ""
        @layout = Layout.default
      end

      #project.path(:source,:main,:as3)
      def path(*args)
        File.join(Gator::Util.find_gator_project, layout.expand(*args))
      end

      def options
        @options ||= {}
      end

      def template_roots
        @template_roots ||= []
      end

    end
  end
end