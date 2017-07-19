class CreateGameCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :game_categories do |t|
      t.references :games, null: false
      t.references :categories, null: false

      t.timestamps
    end
  end
end
