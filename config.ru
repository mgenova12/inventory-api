# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application

require 'rack/cors'
Dotenv::Railtie.load
use Rack::Cors do
 # allow all origins in development
  allow do
    origins ENV['CLIENT_URL']
    resource '*', :headers => :any, :methods => :any, :credentials => true
  end
  
end