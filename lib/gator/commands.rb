require File.dirname(__FILE__) + '/commands/project_command'
require File.dirname(__FILE__) + '/commands/generate_command'

Gator::Runner.register_subcommand Gator::ProjectCommand
Gator::Runner.register_subcommand Gator::GenerateCommand