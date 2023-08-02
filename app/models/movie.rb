class Movie < ApplicationRecord
  validates :title, presence: true
  validates :genre, presence: true
  validates :available_copies, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }

  has_many :favorite_movies, dependent: :destroy
  has_many :rentals, dependent: :destroy
  has_many :users, through: :favorite_movies
end
  