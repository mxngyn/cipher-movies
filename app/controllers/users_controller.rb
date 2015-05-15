class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      redirect_to :back
      flash[:error] = "There was an error creating your account. Please make sure to fill out all of the required fields."
    end
  end

  def new
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :email, :auth_token)
  end

end
