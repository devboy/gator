module Gator
  class Command < Thor
    def self.register_command(name, usage, description, mappings=[], options={})
      Gator::Runner.register self, name, usage, description, options
      Gator::Runner.map mappings => name
    end
  end
end