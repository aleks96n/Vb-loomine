class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  helper :all
  helper_method :current_user
  I18n.config.available_locales = [:en, :ru, :ee]
  before_filter :set_locale

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


  #before_filter :set_user_language



 helper_method :set_locale
 def set_locale
   I18n.locale = params[:locale] || I18n.default_locale

   Rails.application.routes.default_url_options[:locale]= I18n.locale
 end



end
