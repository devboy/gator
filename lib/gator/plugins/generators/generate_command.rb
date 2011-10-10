require 'thor/actions'

class Gator
  class GenerateCommand < Command
    define :command => "generate", :short => "g",
           :usage => "generate TASK", :description => "Generators."
  end
end