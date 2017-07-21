class User < ApplicationRecord
  has_secure_password
  has_many :favoritings
  has_many :ownerships
  has_many :favorited_games, through: :favoritings, source: :game
  has_many :owned_games, through: :ownerships, source: :game
  has_many :reviews, foreign_key: :author_id
  has_many :topics
  has_many :posts

  validates :email, :username, presence:true, uniqueness:true

#PAPERCLIP
  attr_accessor :avatar
  attr_reader :avatar_remote_url
  has_attached_file :avatar, styles: {
    medium: "300x300>",
    square: "200x200>",
    thumb: "100x100>"
    }, default_url: 'default-avatar.jpg'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_attachment_file_name :avatar, matches: [/png\Z/, /jpe?g\Z/]

  def avatar_remote_url=(url_value)
    self.avatar = URI.parse(url_value)
    @avatar_remote_url = url_value
  end

end
