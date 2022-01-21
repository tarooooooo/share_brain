# -*- encoding: utf-8 -*-
# stub: rack-dev-mark 0.7.9 ruby lib

Gem::Specification.new do |s|
  s.name = "rack-dev-mark".freeze
  s.version = "0.7.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Daisuke Taniwaki".freeze]
  s.date = "2020-06-16"
  s.description = "Differentiate development environment from production".freeze
  s.email = ["daisuketaniwaki@gmail.com".freeze]
  s.homepage = "https://github.com/dtaniwaki/rack-dev-mark".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3".freeze)
  s.rubygems_version = "3.1.6".freeze
  s.summary = "Differentiate development environment from production".freeze

  s.installed_by_version = "3.1.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<rack>.freeze, [">= 1.1", "< 2.3"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, [">= 3.0"])
    s.add_development_dependency(%q<coveralls>.freeze, [">= 0"])
  else
    s.add_dependency(%q<rack>.freeze, [">= 1.1", "< 2.3"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 3.0"])
    s.add_dependency(%q<coveralls>.freeze, [">= 0"])
  end
end
