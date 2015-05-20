class SearchesController < ApplicationController

  def show
    @movies = Search.search(params[:term])
    @term = params[:term]
  end

  def new

  end
end