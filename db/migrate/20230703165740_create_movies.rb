class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.string :genre, null: false
      t.float :rating, null: false
      t.integer :available_copies, default: 0, null: false

      t.timestamps
    end

    add_check_constraint :movies, 'rating >= 0 AND rating <= 10', name: 'check_rating_range'

    create_table :favorite_movies do |t|
      t.references :movie, null:false, foreign_key: true
      t.references :user, null:false, foreign_key: true

      t.timestamps
    end

    add_index :favorite_movies, [:user_id, :movie_id], unique: true
  end
end
