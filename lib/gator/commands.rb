require File.dirname(__FILE__) + '/commands/scaffold'
require File.dirname(__FILE__) + '/commands/generate'

Gator::Runner.register_subcommand Gator::ScaffoldCommand
Gator::Runner.register_subcommand Gator::GenerateCommand