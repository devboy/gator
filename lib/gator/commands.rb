require File.dirname(__FILE__) + '/commands/project'
require File.dirname(__FILE__) + '/commands/generate'

Gator::Runner.register_subcommand Gator::ProjectCommand
Gator::Runner.register_subcommand Gator::GenerateCommand