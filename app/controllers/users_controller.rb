class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end
    
    def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:info])
        # if update is successful
    else 
        # if update is unsuccessful
    end
    redirect_to @user
end
  

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end