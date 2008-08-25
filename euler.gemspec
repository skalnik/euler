Gem::Specification.new do |s|
  s.name = %q{euler}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mike Skalnik"]
  s.autorequire = %q{euler}
  s.date = %q{2008-08-25}
  s.description = %q{A gem that provides a small library to help in the solving of Project Euler problems.}
  s.email = %q{mike.skalnik@gmail.com}
  s.extra_rdoc_files = ["README.mkdn", "LICENSE", "TODO"]
  s.files = ["LICENSE", "README.mkdn", "Rakefile", "TODO", "lib/euler.rb"]
  s.has_rdoc = true
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{A gem that provides a small library to help in the solving of Project Euler problems.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
    else
    end
  else
  end
end
