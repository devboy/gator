require 'thor'
require 'thor/group'

module Gator
  class Runner < Thor
    namespace

    def initialize(args=[], options={}, config={})
      super
    end

    desc "version", "Show Gator version"
    def version
      say "Gator --pre"
    end

  end
end