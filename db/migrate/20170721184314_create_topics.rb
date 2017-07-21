class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.string :title, null: false
      t.string :description
      t.integer :user_id
      t.integer :forum_id

      t.timestamps
    end
  end
end
