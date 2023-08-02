require 'test_helper'

class MoviesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @movie = movies(:one)
    @user_with_favorites = users(:user_with_favorites)
    @user_with_rented_movies = users(:user_with_rented_movies)
  end

  test "should get all movies" do
    get movies_url
    assert_response :success

    response_data = JSON.parse(response.body)
    assert_equal Movie.count, response_data.size
  end

  test "should get a movie" do
    get movie_url(@movie)
    assert_response :success

    response_data = JSON.parse(response.body)
    assert_equal @movie.title, response_data["title"]
    assert_equal @movie.genre, response_data["genre"]
  end

  test "should create a movie" do
    assert_difference("Movie.count") do
      post movies_url, params: { movie: { title: "New Movie", genre: "Action", rating: 8.0, available_copies: 5 } }
    end

    assert_response :created
  end

  test "should update a movie" do
    patch movie_url(@movie), params: { movie: { title: "Updated Title" } }
    assert_response :success

    @movie.reload
    assert_equal "Updated Title", @movie.title
  end

  test "should destroy a movie" do
    assert_difference("Movie.count", -1) do
      delete movie_url(@movie)
    end

    assert_response :no_content
  end

  test "should get recommendations for a user with favorites" do
    user = users(:user_with_favorites)

    mock_recommendation_engine = Minitest::Mock.new
    mock_recommendation_engine.expect(:recommendations, [movies(:one), movies(:two)])

    RecommendationEngine.stub(:new, mock_recommendation_engine) do
      get recommendations_movies_url(user_id: user.id)

      assert_response :success

      response_data = JSON.parse(response.body)
      assert_not_empty response_data
      assert_equal 2, response_data.size
    end
  end

  test "should not get recommendations for a user without favorite movies" do
    user = users(:user_without_rented_movies)
  
    get recommendations_movies_url(user_id: user.id)
    assert_response :unprocessable_entity
  end  
end
