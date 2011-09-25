module Gator
  module Project
    # THIS CLASS IS FROM BUILDR => buildr.apache.org
    # Symbolic mapping for directory layout.  Used for both the default and custom layouts.
    #
    # For example, the default layout maps [:source, :main, :java] to 'src/main/java', and
    # [:target, :main, :classes] to 'target/classes'.  You can use this to change the layout
    # of your projects.
    #
    # To map [:source, :main] into the 'sources' directory:
    #   my_layout = Layout.new_template
    #   my_layout[:source, :main] = 'sources'
    #
    #   define 'foo', :layout=>my_layout do
    #     ...
    #   end
    #
    # To map [:source, :main, :java] to 'java/main':
    #   class MainLast < Layout
    #     def expand(*args)
    #       if args[0..1] == [:source, :main]
    #         super args[2], :main, *args[3,]
    #       else
    #         super
    #       end
    #     end
    #   end
    #
    #   define 'foo', :layout=>MainLast do
    #     ...
    #   end
    class Layout

      class << self

        # Default layout used by new_template projects.
        attr_accessor :default

      end

      def initialize #:nodoc:
        @mapping = {}
      end

      # Expands list of symbols and path names into a full path, for example:
      #   puts default.expand(:source, :main, :java)
      #   => "src/main/java"
      def expand(*args)
        args = args.compact.reject { |s| s.to_s.empty? }.map(&:to_sym)
        return '' if args.empty?
        @mapping[args] ||= File.join(*[expand(*args[0..-2]), args.last.to_s].reject(&:empty?)) if args.size > 1
        return @mapping[args] || args.first.to_s
      end

      # Resolves a list of symbols into a path.
      def [](*args)
        @mapping[args.map(&:to_sym)]
      end

      # Specifies the path resolved from a list of symbols.
      def []=(*args)
        @mapping[args[0...-1].map(&:to_sym)] = args.last
      end

      def initialize_copy(copy)
        copy.instance_variable_set :@mapping, @mapping.clone
      end

      # Default layout has the following properties:
      # * :source maps to the 'src' directory.
      # * Anything under :source maps verbatim (e.g. :source, :main becomes 'src/main')
      # * :target maps to the 'target' directory.
      # * :target, :main maps to the 'target' directory as well.
      # * Anything under :target, :main maps verbatim (e.g. :target, :main, :classes becomes 'target/classes')
      # * Anything else under :target also maps verbatim (e.g. :target, :command becomes 'target/command')
      class Default < Layout

        def initialize
          super
          self[:source] = 'src'
          self[:target, :main] = 'target'
        end

      end

      self.default = Default.new

    end
  end
end
