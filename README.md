# Movie Rental API - Technical Challenge

## Overview

Welcome to the Movie Rental API technical challenge! This is a Ruby on Rails project that has been set up with basic models for `User` and `Movie`, and a `MoviesController` with some defined endpoints.

This application simulates part of a movie rental system, where users can rent movies, have favorite movies, and get recommendations based on their favorites.

Your task is to review the existing code, open Pull Requests to suggest any improvements, enhancements, or bug fixes, and reevaluate the existing business logic to propose your own improvements. While the application is functional as it stands, there is always room for improvement!

This project is configured for [Github Codespaces](https://github.com/codespaces), which allows you to work on the project in a fully configured, remote development environment. Feel free to use this feature and create a new Codespace for your repository to make the task execution easier.

The project also includes a seed file that pre-populates the database with users and movies, making it easier for you to test your changes.

## Existing Endpoints

### 1. `GET /movies`

This endpoint retrieves all the movies in the database and returns them in JSON format. Each movie object includes its `id`, `title`, `genre`, `rating`, and the number of `available_copies`.

### 2. `GET /movies/recommendations?user_id=<user_id>`

This endpoint generates a list of movie recommendations for a given user. It uses a basic recommendation engine that takes the user's favorite movies as input and generates recommendations based on those favorites. The response is a JSON array of recommended movie objects.

### 3. `GET /movies/user_rented_movies?user_id=<user_id>`

This endpoint retrieves all the movies that a user has currently rented. The user is identified by the `user_id` parameter in the URL. The response is a JSON array of movie objects that the user has rented.

### 4. `GET /movies/<movie_id>/rent?user_id=<user_id>`

This endpoint allows a user to rent a movie. The user is identified by the `user_id` parameter and the movie by the `id` parameter in the URL. 

If successful, it reduces the number of `available_copies` of the movie by 1 and adds the movie to the user's `rented` movies. The response is a JSON object of the rented movie.

## Your Task

1. **Cloning the repository**: Start by [cloning](https://docs.github.com/en/repositories/creating-and-managing-repositories/duplicating-a-repository) this repository to your local machine, then push it to your own GitHub account. Please, do not fork the repository, otherwise, other candidates will be able to see your solution.
2. **Suggesting changes**: Review the existing code and create Pull Requests (PR) with your proposed changes and explanations, based on the following aspects:
   - **Bad functioning**: Identify any issues (bugs, inefficiencies, etc.).
   - **Refactoring**: If necessary, refactor parts of the code to improve its quality and maintainability. Be sure to explain your reasoning in your PR.
   - **Rethinking the Business Logic**: Feel free to reevaluate the current business logic and assumptions that were previously made. If you have an alternative solution that makes more sense, or would improve the application, please propose it.

### Important Note

Remember, the main goal of this challenge is not to write a fully-functional application, but rather to demonstrate your coding, problem-solving, and communication skills. We value clean and efficient code, and we appreciate creative and thoughtful solutions to problems.

The code has dozens of potential improvements, and we don't expect you to work on all of them. Feel free to prioritize the ones you consider most important to address in **about 3 hours of work**.

_**Happy Coding!**_

# Change Log
   * Refactor movies controller and create of users controllers
   * Added CRUD methods in movies and users
   * Request Validation and handling edge cases in the endpoint services
   * Refactoring the RecomendationEngine
   * Added Integration tests
   * Added API request collection in Insomnia and Postman

# Future Business Logic and features

 **1 - User Reviews and Ratings:** Allow users to leave reviews and ratings for movies they have rented. This could help other users make informed decisions about which movies to rent.

**2 -Movie Recommendations:** Implement a more advanced recommendation system that suggests movies based on user preferences, viewing history, and ratings.

**3 - Multiple Rental Plans:** Offer different rental plans such as monthly subscriptions, pay-per-movie, or bundles that allow users to rent multiple movies at a discounted price.

**4 - Payment Integration:** Integrate a payment gateway to enable secure online payments for movie rentals.

**5 - Notifications:** Send notifications to users when a movie they want to watch becomes available for rent or when a rented movie is about to expire.

**6 - Watchlist:** Allow users to create a watchlist of movies they're interested in watching in the future.

**7 - Streaming Option:** Provide an option for users to stream movies online instead of just renting physical copies.

**8 - User Profiles:** Create user profiles where users can track their rental history, favorite genres, and manage their account settings.

**9 - Admin Dashboard:** Develop an admin dashboard to manage movies, users, rental history, and gain insights into the platform's usage.

**10 - Advanced Search:** Implement a robust search functionality with filters for genre, release year, director, and more.

**11 - User Authentication:** Enhance user authentication with features like two-factor authentication (2FA) for added security.

**12 - Genre-based Subscriptions:** Offer subscription plans based on specific genres, allowing users to access a collection of movies within their favorite genres.

**13 - Social Sharing:** Integrate social media sharing options so users can easily share their movie rentals and reviews with friends.

**14 - Loyalty Programs:** Implement a loyalty program where users earn points or discounts for each rental, encouraging repeat business.

**15 - Offline Mode:** Develop a feature that allows users to download movies for offline viewing during their rental period.

**16 - Parental Controls:** Include parental control options to restrict access to certain movie ratings or genres for family-friendly viewing.

**17 - Mobile App:** Create a mobile app for convenient access to movie rentals on smartphones and tablets.

**18 - Inventory Management:** Implement an inventory management system to track the availability of physical copies and prevent overselling.

**19 - Suggested Movies:** Provide a "suggested movies" section on the platform's homepage, showcasing popular or newly added movies.

**20 - Advanced Analytics:** Use analytics to track user behavior, rental trends, and movie popularity to make informed business decisions.