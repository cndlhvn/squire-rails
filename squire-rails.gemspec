$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "squire-rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "squire-rails"
  s.version     = SquireRails::VERSION
  s.authors     = ["candle"]
  s.email       = ["progted@gmail.com"]
  s.homepage    = "https://github.com/cndlhvn"
  s.summary     = "Squire Editor for rails"
  s.description = "Squire Editor for rails"

  s.files = Dir["{app,config,db,lib}/**/*", 'vendor/assets/**/*', "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"

  #s.add_development_dependency "sqlite3"
end
