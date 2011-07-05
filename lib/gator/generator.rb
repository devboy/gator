require "thor/group"
require "thor/actions"

module Gator
  class Generator < Thor::Group
    include Thor::Actions
    def self.register_generator( target, name, usage, description, mappings=[], options={} )
      target.register self, name, usage,description,options
      target.map mappings => name
    end
  end
end