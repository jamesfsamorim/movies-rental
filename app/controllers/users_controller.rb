class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
  end

  def rent_movie
    user = User.find(params[:id])
    return user_not_found unless user

    movie = Movie.find_by(id: params[:movie_id])
    return movie_not_found unless movie

    return no_copies_of_movie unless movie.available_copies.positive?

    Movie.transaction do
      movie.update!(available_copies: movie.available_copies - 1)
      user.rented << movie
    end

    movie.reload
    render json: movie
  end

  def rented
    user = User.find(params[:id])
    return user_not_found unless user

    render json: user.rented
  end

  def user_not_found
    head :not_found
  end

  def movie_not_found
    head :not_found
  end

  def no_copies_of_movie
    render json: { error: "No available copies for this movie." }, status: :unprocessable_entity
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name)
  end
end
