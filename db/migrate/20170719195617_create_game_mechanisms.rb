class CreateGameMechanisms < ActiveRecord::Migration[5.1]
  def change
    create_table :game_mechanisms do |t|
      t.references :game, null: false
      t.references :mechanism, null: false

      t.timestamps
    end
  end
end
