class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  force_ssl if: :production?

  before_filter :require_auth_key

  private

  def require_auth_key
    return unless Rails.env.production?

    raise "Need AUTH_KEY configured in prod." unless ENV['AUTH_KEY']

    if !session[:authorized] && params[:auth_key] != ENV['AUTH_KEY']
      render text: ''
    else
      session[:authorized] = true
    end
  end

  def production?
    Rails.env.production?
  end
end
