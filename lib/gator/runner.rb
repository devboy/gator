require 'thor'
require 'thor/group'
require 'thor/actions'

module Gator
  class Runner < Command
    include Thor::Actions

    def self.start
      Gator::Util.initialize_files
      super
    end

    desc "version", "Show Gator version"
    def version
      version_file = File.dirname(__FILE__) + '/../../VERSION'
      say File.exist?(version_file) ? File.read(version_file) : ""
    end

  end
end