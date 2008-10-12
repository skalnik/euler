Gem::Specification.new do |s|
  s.name = %q{euler}
  s.version = "1.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mike Skalnik"]
  s.cert_chain = ["/Users/Oompa/.gem/gem-public_cert.pem"]
  s.date = %q{2008-08-26}
  s.description = %q{A gem that provides a small library to help in removing the repetativeness of solving Project Euler problems.}
  s.email = ["mike.skalnik@gmail.com"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "Manifest.txt", "README.txt", "Rakefile", "lib/euler.rb", "test/test_euler.rb", "test/tc_integer_methods.rb", "test/tc_module.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/Oompa/euler}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{euler}
  s.rubygems_version = %q{1.2.0}
  s.signing_key = %q{/Users/Oompa/.gem/gem-private_key.pem}
  s.summary = %q{A small library to help solve Projet Euler problems.}
  s.test_files = ["test/test_euler.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
      s.add_development_dependency(%q<hoe>, [">= 1.7.0"])
    else
      s.add_dependency(%q<hoe>, [">= 1.7.0"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 1.7.0"])
  end
end
