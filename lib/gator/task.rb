require "thor/group"
require "thor/actions"

module Gator
  class Task < Thor::Group
    include ActAsCommand
    include Thor::Actions
  end
end