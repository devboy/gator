unless defined?(SpecHelpers)

  require File.dirname(__FILE__)+'/../lib/gator'

  require 'simplecov'
  require 'simplecov-rcov'

  SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter
  SimpleCov.root(  File.dirname( __FILE__) + '/..' )
  SimpleCov.start

  RSpec.configure do |config|
  end

end

