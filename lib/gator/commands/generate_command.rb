require 'thor/actions'

module Gator
  class GenerateCommand < Command
    include Thor::Actions

    register_command "generate", "generate TASK", "Generators.", ["g"]

  end
end