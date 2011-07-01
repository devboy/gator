# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{gator}
  s.version = "0.0.4.pre"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dominic Graefen"]
  s.date = %q{2011-07-01}
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
    "Gemfile",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "bin/gator",
    "gator.gemspec",
    "lib/core.rb",
    "lib/core/cli.rb",
    "lib/core/cli/application.rb",
    "lib/core/cli/shell.rb",
    "lib/core/command.rb",
    "lib/core/configuration.rb",
    "lib/core/configuration/configuration.rb",
    "lib/core/plugin.rb",
    "lib/core/project.rb",
    "lib/core/project/layout.rb",
    "lib/core/project/project.rb",
    "lib/gator.rb",
    "test/helper.rb",
    "test/test_gator.rb"
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
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
    else
      s.add_dependency(%q<thor>, ["~> 0.14.6"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
    end
  else
    s.add_dependency(%q<thor>, ["~> 0.14.6"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
  end
end

