class ApplicationController < ActionController::Base
  force_ssl if: :production?

  before_filter :require_auth_key
  before_filter :allow_iframe

  private

  def require_auth_key
    return unless Rails.env.production?

    raise "Need AUTH_KEY configured in prod." unless ENV['AUTH_KEY']

    if !session[:authorized] && params[:auth_key] != ENV['AUTH_KEY']
      render text: "Not authorized, did you forget to add \"auth_key\" to the url?\n"
    else
      session[:authorized] = true
    end
  end

  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end

  def production?
    Rails.env.production?
  end
end
