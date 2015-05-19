class MoviesController < ApplicationController

  def show
    @movies = Movie.search(params[:term])
    @term = params[:term]
  end

  def new

  end
end
