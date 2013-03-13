require 'simplecov'
SimpleCov.start
require 'jet_fuel'
require 'capybara'
require 'capybara/rspec'
require 'rack/test'
require 'active_record'


RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.around do |example|
    ActiveRecord::Base.transaction do
      example.run
      raise ActiveRecord::Rollback
    end
  end

  config.order = 'random'
end
