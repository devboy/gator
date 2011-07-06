require "thor/group"
require "thor/actions"

module Gator
  class Task < Thor::Group
    include Thor::Actions

    def self.define( definition )
      @definition = d = definition
      d[:on].register self, d[:as], d[:usage], d[:description], d[:options] || {}
      d[:on].map [ d[:short] ] => d[:as] unless d[:short].nil?
    end
  end
end