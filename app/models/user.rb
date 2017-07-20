class User < ApplicationRecord
  has_secure_password
  has_many :favoritings
  has_many :ownerships
  has_many :favorited_games, through: :favoritings, source: :game
  has_many :owned_games, through: :ownerships, source: :game
  has_many :reviews, foreign_key: :author_id

  validates :email, :username, presence:true, uniqueness:true
end
