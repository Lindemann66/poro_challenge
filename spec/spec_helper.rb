ENV["RAILS_ENV"] ||= 'test'
require 'simplecov'
SimpleCov.start

require_relative '../application'
require_relative '../api_processor'
require 'rspec'
require 'webmock/rspec'

RSpec.configure do |config|
  config.mock_with :rspec
  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true

  config.expect_with(:rspec) { |c| c.syntax = [:should, :expect] }
  config.mock_with(:rspec) { |c| c.syntax = [:should, :expect] }
end
