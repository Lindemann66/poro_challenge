require 'bundler'
require 'yaml'
require 'logger'
require 'rest-client'

require 'standalone_migrations'

StandaloneMigrations::Tasks.load_tasks

ActiveRecord::Base.establish_connection(
  adapter:  "mysql2",
  host:     "localhost",
  username: "root",
  password: "",
  database: "shastic_dev"
)

module Application

  def self.root
    @root ||= File.expand_path('..', __FILE__)
  end

  def self.env
    @env = ENV['RUBY_ENV'] || ENV['RAILS_ENV'] || 'development'
  end

  def self.settings
    @settings ||= YAML.load_file(File.join(root, 'config', 'settings.yml'))[env]
  end

  def self.logger
    @logger ||= begin
      logger = Logger.new(File.join(root, 'log', "#{ env }.log"))
      logger.datetime_format = "%Y-%m-%d %H:%M:%S.%L %Z "
      logger
    end
  end
end

Bundler.require(:default, Application.env)

Dir[File.join(File.dirname(__FILE__), 'lib/**/*.rb')].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), 'app/models/**/*.rb')].each {|f| require f}
