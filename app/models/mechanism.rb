class Mechanism < ApplicationRecord
  has_many :game_mechanisms
  has_many :games, through: :game_mechanisms

  validates :name, presence: true, uniqueness: true
end
