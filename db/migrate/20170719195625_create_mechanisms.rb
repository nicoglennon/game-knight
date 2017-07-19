class CreateMechanisms < ActiveRecord::Migration[5.1]
  def change
    create_table :mechanisms do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
