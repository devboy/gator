require 'thor'
require 'thor/group'
require 'thor/actions'

module Gator
  class Runner < Thor
    include Thor::Actions

    def self.start
      Gator::Util.initialize_files
      super
    end

    desc "version", "Show Gator version"
    def version
      say "Gator --pre"
    end

  end
end