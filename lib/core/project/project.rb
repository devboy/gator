module Gator
  class Project

    attr_reader :name

    def initialize( name )
      @name = name
      @layout = Layout.default
    end

    def path(*args)
      File.join( Gator.base_dir, layout.expand(*args) )
    end

    def layout
      @layout
    end

    def layout=( l )
      @layout = l
    end

  end
end