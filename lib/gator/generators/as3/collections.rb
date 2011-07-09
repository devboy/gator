require File.dirname(__FILE__) + '/class_generator'
require File.dirname(__FILE__) + '/test/class_test_generator'

module Gator
  module AS3

    class GeneratorCollection < Gator::Command
      define :command => "as3",
             :usage => "generate as3 GENERATOR", :description => "Generators for AS3."
      register_subcommand Gator::AS3::ClassGenerator
    end
    Gator::GenerateCommand.register_subcommand GeneratorCollection

    class TestGeneratorCollection < Gator::Command
      define :command => "test",
             :usage => "generate as3 test GENERATOR", :description => "TestGenerators for AS3."
      register_subcommand Gator::AS3::ClassTestGenerator
    end
    GeneratorCollection.register_subcommand TestGeneratorCollection

  end
end