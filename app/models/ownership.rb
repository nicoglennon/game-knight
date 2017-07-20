class Ownership < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :user_id, uniqueness: { scope: :game_id, message: "This game is already in your collection"}
end
