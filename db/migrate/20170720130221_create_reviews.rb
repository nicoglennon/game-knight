class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :body
      t.integer :game_id
      t.integer :author_id

      t.timestamps
    end
  end
end
