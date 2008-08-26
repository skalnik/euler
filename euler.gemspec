Gem::Specification.new do |s|
  s.name = %q{euler}
  s.version = "1.0.3"
  s.date = %q{2008-08-26}
  s.summary = %q{A small library to help solve Projet Euler problems.}
  s.email = %q{mike.skalnik@gmail.com}
  s.homepage = %q{http://www.github.com/Oompa/euler}
  s.rubyforge_project = %q{euler}
  s.description = %q{A gem that provides a small library to help in the solving of Project Euler problems.}
  s.has_rdoc = true
  s.authors = ["Mike Skalnik"]
  s.files = Dir.glob('*.txt') << 'lib/euler.rb'
  s.extra_rdoc_files = Dir.glob('*.txt')
  s.require_paths = ["lib"]
  s.test_files = Dir.glob('test/tc_*.rb') << 'test/test_euler.rb'
end
