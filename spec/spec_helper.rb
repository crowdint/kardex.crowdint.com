ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../dummy/config/environment", __FILE__)
require 'rspec/rails'
require 'pry'
require 'database_cleaner'

Dir[File.join(File.realpath(File.dirname(__FILE__)), 'support', '*')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

DatabaseCleaner.strategy = :truncation

RSpec.configure do |config|
  config.use_transactional_fixtures = true

  config.order = "random"

  config.before(:each) do
    DatabaseCleaner.clean
  end

end
