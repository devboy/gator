class Gator
  class Project
    include Gator::ActAsConfiguration

    attr_accessor :name, :layout

    def initialize
      @name = ""
      @layout = Layout.default
    end

    def path(*args)
      File.join(Gator::Util.find_project_dir, layout.expand(*args))
    end

    def template_roots
      @template_roots ||= []
    end

  end
end