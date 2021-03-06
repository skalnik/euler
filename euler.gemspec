# Generated by jeweler
# DO NOT EDIT THIS FILE
# Instead, edit Jeweler::Tasks in Rakefile, and run `rake gemspec`
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{euler}
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mike Skalnik", "Nick Kezhaya"]
  s.date = %q{2009-10-11}
  s.description = %q{A gem that provides a small library to help in removing the repetativeness of solving Project Euler problems.}
  s.email = %q{mike.skalnik@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "euler.gemspec",
     "lib/euler.rb",
     "lib/rudoku.rb",
     "test/tc_integer_methods.rb",
     "test/tc_module.rb",
     "test/tc_rudoku.rb",
     "test/test_euler.rb"
  ]
  s.homepage = %q{http://github.com/skalnik/euler}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{euler}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{A small library to help solve Projet Euler problems.}
  s.test_files = [
    "test/tc_integer_methods.rb",
     "test/tc_module.rb",
     "test/tc_rudoku.rb",
     "test/test_euler.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
