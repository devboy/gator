require 'thor'
require 'thor/group'

module Gator
  class Runner < Thor

    desc "version", "Show Gator version"
    def version
      say "Gator --pre"
    end

  end
end