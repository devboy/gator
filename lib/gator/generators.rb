require File.dirname(__FILE__) + '/generators/as3/collections'
Dir.glob( File.join( File.dirname(__FILE__), "generators", "**", "*.rb" ) ).each { |rb| require rb }