require 'thor'
require 'thor/group'
require 'thor/actions'

class Gator
  class Runner < Command
    include Thor::Actions

  end
end