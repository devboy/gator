require 'thor/actions'

module Gator
  class GenerateCommand < Command
    register_command Gator::Runner, "generate", "generate TASK", "Generators.", ["g"]
  end
end