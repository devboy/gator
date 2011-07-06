require "thor/group"
require "thor/actions"

module Gator
  class Task < Thor::Group
    include Thor::Actions
    def self.register_task( target, name, usage, description, mappings=[], options={} )
      target.register self, name, usage,description,options
      target.map mappings => name
    end
  end
end