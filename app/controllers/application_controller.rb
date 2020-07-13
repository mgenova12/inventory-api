class ApplicationController < ActionController::API
  include ActionController::Helpers
  include ActionController::RequestForgeryProtection
  protect_from_forgery unless: -> { request.format.json? }
  before_action :current_user, :cors_preflight_check
  after_action :cors_set_access_control_headers  
  helper_method :login!, :logged_in?, :current_user, :authorized_user?, :logout!
  skip_before_action :verify_authenticity_token

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = ENV['CLIENT_URL']
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end

  # If this is a preflight OPTIONS request, then short-circuit the
  # request, return only the necessary headers and return an empty
  # text/plain.

  def cors_preflight_check
    if request.method == :options
      headers['Access-Control-Allow-Origin'] = ENV['CLIENT_URL']
      headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
      render :text => '', :content_type => 'text/plain'
    end
  end


  def login!
    crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base.byteslice(0..31))
    token = crypt.encrypt_and_sign("user-id:#{ @user.id }")
    @user.update(token: token)
  end

  def logged_in?    
    !!params[:token]
  end

  def current_user
    @current_user ||= User.find_by(token: params[:token]) if !!params[:token]
  end

  def authorized_user?
    @user == current_user
  end

  def logout!
    session.clear
  end

end
