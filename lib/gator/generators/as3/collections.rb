module Gator
  module AS3

    class GeneratorCollection < Gator::Command
      define :on => Gator::GenerateCommand, :as => "as3",
             :usage => "generate as3 GENERATOR", :description => "Generators for AS3."
    end

    class TestGeneratorCollection < Gator::Command
      define :on => GeneratorCollection, :as => "test",
             :usage => "generate as3 test GENERATOR", :description => "TestGenerators for AS3."
    end

  end
end