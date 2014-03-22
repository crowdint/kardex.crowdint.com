$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'kardex/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'kardex'
  s.version     = Kardex::VERSION
  s.authors     = ['Crowd Interactive']
  s.email       = ['kardex@crowdint.com']
  s.homepage    = 'http://crowdint.com'
  s.summary     = 'A Rails engine to help users create events and manage assistance'
  s.description = 'Crowd Interactive internal tool to allow its employees to create and manage events assistance'


  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 4.1.0.rc1'
  s.add_dependency 'pg'

  s.add_development_dependency 'spring'
  s.add_development_dependency 'pry', '~> 0.9.12.6'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'rspec-rails', '~> 3.0.0.beta'
end
