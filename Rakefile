require_relative './api_processor.rb'

require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/*/*_spec.rb'
end

namespace :api_processor do
  desc 'Make external api request and process all the data'
  task :call do
    ApiProcessor.call
  end
end

#namespace :db do
#  desc 'Run the database migrations'
#  task :migrate do
#    ActiveRecord::Migrator.up 'db/migrate'
#  end
#
#  desc 'Create the databases'
#  task :create do
#  end
#end

task :default => :spec
