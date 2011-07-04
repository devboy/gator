# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{gator}
  s.version = "0.0.7.pre"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dominic Graefen"]
  s.date = %q{2011-07-04}
  s.default_executable = %q{gator}
  s.description = %q{gator - the friendly code-generator}
  s.email = %q{dominic.graefen@gmail.com}
  s.executables = ["gator"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "bin/gator",
    "gator.gemspec",
    "lib/__legacy/core.rb",
    "lib/__legacy/core/cli.rb",
    "lib/__legacy/core/cli/application.rb",
    "lib/__legacy/core/cli/shell.rb",
    "lib/__legacy/core/command.rb",
    "lib/__legacy/core/command/command.rb",
    "lib/__legacy/core/configuration.rb",
    "lib/__legacy/core/configuration/configuration.rb",
    "lib/__legacy/core/project_command.rb",
    "lib/__legacy/core/project/layout.rb",
    "lib/__legacy/core/project/project_command.rb",
    "lib/__legacy/default.rb",
    "lib/__legacy/default/commands/generator_command.rb",
    "lib/__legacy/default/commands/new_command.rb",
    "lib/__legacy/default/commands/new_template/.gator/project_command.rb.tt",
    "lib/__legacy/default/generators/AS3ClassTemplate.as.tt",
    "lib/__legacy/default/generators/as3_class_generator.rb",
    "lib/__legacy/gator.rb",
    "lib/gator.rb",
    "lib/gator/command.rb",
    "lib/gator/project_command.rb",
    "lib/gator/runner.rb",
    "lib/gator/util.rb",
    "spec/core/command/command_spec.rb",
    "spec/core/project/project_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/devboy/gator}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{gator - the friendly code-generator}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<thor>, ["~> 0.14.6"])
      s.add_development_dependency(%q<rspec>, ["~> 2.3.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
    else
      s.add_dependency(%q<thor>, ["~> 0.14.6"])
      s.add_dependency(%q<rspec>, ["~> 2.3.0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
    end
  else
    s.add_dependency(%q<thor>, ["~> 0.14.6"])
    s.add_dependency(%q<rspec>, ["~> 2.3.0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
  end
end

