class CreateGamesMechanisms < ActiveRecord::Migration[5.1]
  def change
    create_table :games_mechanisms do |t|
      t.integer :game_id, null: false
      t.integer :mechanism_id, null: false

      t.timestamps
    end
  end
end

