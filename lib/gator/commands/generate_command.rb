require 'thor/actions'

module Gator
  class GenerateCommand < Command
    define :on => Gator::Runner, :as => "generate", :short => "g",
           :usage => "generate TASK", :description => "Generators."
  end
end