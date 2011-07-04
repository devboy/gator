require "thor/group"

module Gator
  class Generator < Thor
    def self.register_generator( name, usage, description, mappings=[], options={} )
      Gator::GenerateCommand.register self, name, usage,description,options
      Gator::GenerateCommand.map mappings => name
    end
  end
end