class Gator
  module Sandbox
    def self.add_getter name, value
      Gator::Sandbox.class.send :define_method, name do
        value
      end
    end
  end
end