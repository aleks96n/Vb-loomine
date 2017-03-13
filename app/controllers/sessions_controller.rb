class SessionsController < ApplicationController
#  def create
#    user = User.from_omniauth(env["omniauth.auth"])
#    session[:user_id] = user.id
#    redirect_to root_path
#  end

  def destroy
    log_out
    redirect_to root_url
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      render 'new'
    end
  end

  def createfb
      @user = User.find_or_create_from_auth_hash(auth_hash)
      log_in @user
      redirect_to root_url
      end

  def auth_hash
    request.env['omniauth.auth']
  end

end
