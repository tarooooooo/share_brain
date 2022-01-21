# -*- encoding: utf-8 -*-
# stub: redis-session-store 0.11.3 ruby lib

Gem::Specification.new do |s|
  s.name = "redis-session-store".freeze
  s.version = "0.11.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Mathias Meyer".freeze]
  s.date = "2020-07-23"
  s.description = "A drop-in replacement for e.g. MemCacheStore to store Rails sessions (and Rails sessions only) in Redis. For great glory!".freeze
  s.email = ["meyer@paperplanes.de".freeze]
  s.extra_rdoc_files = ["LICENSE".freeze, "AUTHORS.md".freeze, "CONTRIBUTING.md".freeze]
  s.files = ["AUTHORS.md".freeze, "CONTRIBUTING.md".freeze, "LICENSE".freeze]
  s.homepage = "https://github.com/roidrage/redis-session-store".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.1.6".freeze
  s.summary = "A drop-in replacement for e.g. MemCacheStore to store Rails sessions (and Rails sessions only) in Redis.".freeze

  s.installed_by_version = "3.1.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<actionpack>.freeze, [">= 3", "< 7"])
    s.add_runtime_dependency(%q<redis>.freeze, [">= 3", "< 5"])
    s.add_development_dependency(%q<fakeredis>.freeze, ["~> 0.8"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 13"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3"])
    s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.81"])
    s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.17"])
  else
    s.add_dependency(%q<actionpack>.freeze, [">= 3", "< 7"])
    s.add_dependency(%q<redis>.freeze, [">= 3", "< 5"])
    s.add_dependency(%q<fakeredis>.freeze, ["~> 0.8"])
    s.add_dependency(%q<rake>.freeze, ["~> 13"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.81"])
    s.add_dependency(%q<simplecov>.freeze, ["~> 0.17"])
  end
end
