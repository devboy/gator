unless defined?(SpecHelpers)

  require 'simplecov'
  require 'simplecov-rcov'

  SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter
  SimpleCov.root(  File.dirname( __FILE__) + '/../' )
  puts SimpleCov.root
  SimpleCov.start

  require File.dirname(__FILE__)+'/../lib/gator'

  RSpec.configure do |config|
  end

end

