class CreateGameCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :game_categories do |t|
      t.integer :game_id, null: false
      t.integer :category_id, null: false

      t.timestamps
    end
  end
end
