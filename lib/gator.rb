require "thor"
require "thor/group"
require File.dirname(__FILE__) + '/core'
require File.dirname(__FILE__) + '/default'

# This makes gator module functions locally available in config & project files
module Gator
  include Gator::Project
  include Gator::Configuration
end
class << self;
  include Gator
end
