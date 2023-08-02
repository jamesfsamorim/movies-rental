class RecommendationEngine
  def initialize(favorite_movies)
    @favorite_movies = favorite_movies
  end

  def recommendations
    favorite_movie_titles = @favorite_movies.pluck(:title)
    common_genres = Movie.where(title: favorite_movie_titles).group(:genre).order(Arel.sql('COUNT(genre) DESC')).limit(3).pluck(:genre)
    
    Movie.where(genre: common_genres).order(rating: :desc).limit(10)
  end
end