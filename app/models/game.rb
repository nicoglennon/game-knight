class Game < ApplicationRecord
  has_many :ownerships
  has_many :owners, through: :ownerships, source: :user
  has_many :favoritings
  has_many :fans, through: :favoritings, source: :user
  has_many :game_mechanisms
  has_many :mechanisms, through: :game_mechanisms
  has_many :game_categories
  has_many :categories, through: :game_categories
  has_many :reviews

  validates :title, presence: true

  def self.search(search)
    self.where("title LIKE ? OR description LIKE ?", "%#{search.capitalize}%", "%#{search.capitalize}%")
  end

  # def self.advanced_search(search)
  #   self.where("title LIKE ? OR description LIKE ?", "%#{search.capitalize}%", "%#{search.capitalize}%")
  # end

  def most_popular_games(games)

  end

  def best_selling_games(games)
  end
end
