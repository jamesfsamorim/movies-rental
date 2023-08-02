Rails.application.routes.draw do
  root "movies#index"

  resources :movies do
    get 'recommendations', on: :collection
  end

  resources :users do
    post 'rent_movie/:movie_id', to: 'users#rent_movie', on: :member, as: :rent_movie
    get 'movies/rented', on: :member, to: 'users#rented', as: :user_rented_movies
  end  
end
