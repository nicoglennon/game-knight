class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :title, null: false
      t.text :description
      t.string :number_of_players
      t.integer :duration
      t.string :release_date
      t.string :designer
      t.string :image_url
      t.string :image_thumbnail_url
      t.integer :bgg_id

      t.timestamps
    end
  end
end
