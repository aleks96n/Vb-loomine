class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  helper :all
  helper_method :current_user
  I18n.config.available_locales = [:en, :wk]

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  #before_filter :set_user_language

  #private
  #def set_user_language
  #  I18n.locale = 'wk'
  #end
end
