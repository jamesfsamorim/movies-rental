class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :update, :destroy]
  
  def index
    @movies = Movie.all
    render json: @movies
  end

  def show
    render json: @movie
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      render json: @movie, status: :created, location: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  def update
    if @movie.update(movie_params)
      render json: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @movie.destroy
  end

  def recommendations
    user = User.find(params[:user_id])
    return user_not_found unless user

    favorite_movies = user.favorites
    return no_favorite_movies_enough if favorite_movies.empty?

    render json: RecommendationEngine.new(favorite_movies).recommendations
  end

  def user_not_found
    head :not_found
  end

  def movie_not_found
    head :not_found
  end

  def no_favorite_movies_enough
    render json: { error: "No information of your favorite movies enough to recommendations." }, status: :unprocessable_entity
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :genre, :rating, :available_copies)
  end
end
