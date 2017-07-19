class CreateGameMechanisms < ActiveRecord::Migration[5.1]
  def change
    create_table :game_mechanisms do |t|
      t.references :games, null: false
      t.references :mechanisms, null: false

      t.timestamps
    end
  end
end
