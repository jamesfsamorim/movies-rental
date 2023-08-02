require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:user_with_favorites)
  end

  test "should get all users" do
    get users_url
    assert_response :success

    response_data = JSON.parse(response.body)
    assert_equal User.count, response_data.size
  end

  test "should get a user" do
    get user_url(@user)
    assert_response :success

    response_data = JSON.parse(response.body)
    assert_equal @user.name, response_data["name"]
  end

  test "should create a user" do
    assert_difference("User.count") do
      post users_url, params: { user: { name: "New User" } }
    end

    assert_response :created
  end

  test "should update a user" do
    patch user_url(@user), params: { user: { name: "Updated User" } }
    assert_response :success

    @user.reload
    assert_equal "Updated User", @user.name
  end

  test "should destroy a user" do
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end

    assert_response :no_content
  end

  test "should rent a movie for a user with available copies" do
    user = users(:user_without_rented_movies)
    movie = movies(:two)
    
    assert_difference("Movie.find(movie.id).available_copies", -1) do
      assert_difference("user.rented.count") do
        post rent_movie_user_url(user.id, movie.id)
        assert_response :success
      end
    end
  end  

  test "should return forbidden when renting a movie with no available copies" do
    user = users(:user_without_rented_movies)
    movie = movies(:without_available_copies)

    assert_no_difference("movie.available_copies") do
      assert_no_difference("user.rented.count") do
        post rent_movie_user_url(user.id, movie.id)
        assert_response :unprocessable_entity
  
        response_data = JSON.parse(response.body)
        assert_equal "No available copies for this movie.", response_data["error"]
      end
    end
  end

  test "should get all rented movies for a specific user" do
    user = users(:user_with_rented_movies)

    get user_rented_movies_user_url(id: user.id)
    assert_response :success

    response_data = JSON.parse(response.body)
    assert_not_empty response_data
    assert_equal user.rented.count, response_data.size
  end
end
