module Gator
  class Command < Thor
    def self.register_command(target, name, usage, description, mappings=[], options={})
      target.register self, name, usage, description, options
      target.map mappings => name
    end
  end
end