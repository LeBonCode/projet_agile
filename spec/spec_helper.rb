require 'rubygems'
require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  Dir[Rails.root.join('spec/support/**/*.rb')].each{|f| require f}
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'paperclip/matchers'

  unless ENV['DRB']
    require 'simplecov'
    SimpleCov.start 'rails'
  end

  RSpec.configure do |config|
    config.include Paperclip::Shoulda::Matchers
    config.include FactoryGirl::Syntax::Methods

    config.mock_with :rspec

    config.treat_symbols_as_metadata_keys_with_true_values = true
    config.run_all_when_everything_filtered = true
    config.filter_run :focus

    config.before(:suite) do
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.clean_with(:truncation)
    end

    config.before(:each) do
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end

    # Run specs in random order to surface order dependencies. If you find an
    # order dependency and want to debug it, you can fix the order by providing
    # the seed, which is printed after each run.
    #     --seed 1234
    config.order = 'random'
  end
end

Spork.each_run do
  if ENV['DRB']
    require 'simplecov'
    SimpleCov.start 'rails'
  end

  FactoryGirl.reload
end