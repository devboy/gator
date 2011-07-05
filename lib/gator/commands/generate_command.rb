require 'thor/actions'

module Gator
  class GenerateCommand < Command
    register_command "generate", "generate TASK", "Generators.", ["g"]
  end
end