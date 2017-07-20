class Favoriting < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :user_id, uniqueness: { scope: :game_id, message: "You already favorited this game"}
end

