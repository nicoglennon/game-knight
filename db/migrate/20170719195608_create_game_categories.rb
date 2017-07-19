class CreateGameCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :game_categories do |t|
      t.references :game, null: false
      t.references :category, null: false

      t.timestamps
    end
  end
end
