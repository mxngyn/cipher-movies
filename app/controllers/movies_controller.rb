class MoviesController < ApplicationController

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      User.find(session[:user_id]).movies << @movie
      redirect_to :controller => 'sessions', :action => 'show'
    else
      redirect_to :back
      flash[:error] = "There was an error saving the movie."
    end
  end

  def new
  end

  def movie_params
    params.require(:movie).permit(:title, :pic_url)
  end

end
