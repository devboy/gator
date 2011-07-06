module Gator
  module AS3
    class GeneratorCollection < Gator::Command
      register_command Gator::GenerateCommand, "as3", "generate as3 GENERATOR", "Generators for AS3"
    end
    class TestGeneratorCollection < Gator::Command
      register_command GeneratorCollection, "test", "generate as3 test GENERATOR", "TestGenerators for AS3"
    end
  end
end