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

  def self.popular
    self.select("games.*, COUNT(fans.id) fan_count").joins(:favoritings).group('games.id').order("fan_count DESC")

  end

  def self.best_selling
    self.where
  end
end
