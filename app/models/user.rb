class User < ApplicationRecord
  has_many :favorite_movies, dependent: :destroy
  has_many :rentals, dependent: :destroy
  has_many :favorites, through: :favorite_movies, source: :movie
  has_many :rented, through: :rentals, source: :movie
end