class CreateFavoritings < ActiveRecord::Migration[5.1]
  def change
    create_table :favoritings do |t|
      t.references :user
      t.references :game
    end
  end
end
