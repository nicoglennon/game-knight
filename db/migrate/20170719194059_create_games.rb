class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :title, null: false
      t.text :description
      t.string :number_of_players
      t.string :duration
      t.datetime :release_date
      t.string :publisher

      t.timestamps
    end
  end
end
