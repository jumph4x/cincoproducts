class ApplicationController < ActionController::Base
  #http_basic_authenticate_with name: "tim", password: "eric" if Rails.env.production?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :redirect_to_www

  def redirect_to_www
    return true if !Rails.env.production? || !request.host.match(/www\./)
    redirect_to "http://cincoproducts.com"
  end
end
