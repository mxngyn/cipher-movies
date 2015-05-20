class SessionsController < ApplicationController

  def new

  end

  def create

    @user = User.find_by(email: session_params[:email])

    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to :dashboard
    else
      redirect_to :back
      flash[:notice] = "There was an error with your login."
    end
  end

  def show
    if session[:user_id] != nil
      @user = User.find(session[:user_id])
      @movies = Movie.where(user_id: @user.id)
    else
      flash[:notice] = "Please log in or create an account."
      redirect_to :root
    end
  end

  def destroy
    session.clear
    reset_session
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

end
