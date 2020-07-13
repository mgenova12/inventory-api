# Be sure to restart your server when you modify this file.
# Dotenv::Railtie.load
# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.
Dotenv::Railtie.load
# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins ENV['CLIENT_URL'] #replace this url with that of your own heroku client app
    resource '*', :headers => :any, :methods => :any, :credentials => true
  end
end
