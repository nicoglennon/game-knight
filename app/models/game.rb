class Game < ApplicationRecord
  # has_many :ownerships
  # has_many :owners, through: :ownerships
  # has_many :favoritings
  # has_many :fans, through: :favoritings
  # has_many :game_mechanisms
  # has_many :mechanisms, through: game_mechanisms
  # belongs_to :category

  validates :title, presence: true
end
