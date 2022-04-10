require 'yaml'
require 'active_record'
require 'dotenv'
require 'erb'
require 'active_job'
require 'sidekiq' 
require 'sidekiq-scheduler'
require 'nokogiri'
require 'httparty'

app_files = File.expand_path('../app/**/*.rb', __FILE__)
Dir.glob(app_files).each { |file| require(file) }

class Application
  def call(env)
    request = Rack::Request.new(env)
    serve_request(request)
  end

  def serve_request(request)
    Router.new(request).route!
  end

   def self.root
     @root ||= File.dirname(File.expand_path('..', __FILE__))
   end

   def self.env
     @env ||= ENV["RAILS_ENV"] || ENV["RACK_ENV"] || ENV["ENV"] || "development"
   end

   def self.logger
     @logger ||= Logger.new(STDOUT)
   end


end


  ENV['ENVIRONMENT'] ||= 'development'
  Dotenv.load(".env.#{ENV.fetch('ENVIRONMENT')}.local", ".env.#{ENV.fetch('ENVIRONMENT')}", '.env')


  def db_configuration
    db_configuration_file_path = File.join(File.expand_path('..', __dir__),'umai', 'db', 'config.yml')
    db_configuration_result = ERB.new(File.read(db_configuration_file_path)).result
    YAML.safe_load(db_configuration_result, aliases: true)
  end

  ActiveRecord::Base.establish_connection(db_configuration[ENV['ENVIRONMENT']])
