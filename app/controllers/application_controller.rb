class ApplicationController < ActionController::API
  include ActionController::Helpers
  include ActionController::RequestForgeryProtection
  protect_from_forgery unless: -> { request.format.json? }
  helper_method :login!, :logged_in?, :current_user, :authorized_user?, :logout!
  skip_before_action :verify_authenticity_token

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
