module Gator
  module Project
    class Base
      include Gator::Configuration::ActAsConfiguration

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

      def template_roots
        @template_roots ||= []
      end

    end
  end
end