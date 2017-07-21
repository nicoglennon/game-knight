class User < ApplicationRecord

  has_secure_password
  has_many :favoritings
  has_many :ownerships
  has_many :favorited_games, through: :favoritings, source: :game
  has_many :owned_games, through: :ownerships, source: :game
  has_many :reviews, foreign_key: :author_id

  validates :email, :username, presence:true, uniqueness:true

# PAPERCLIP
  has_attached_file :avatar, styles: { medium: "300x300", thumb: "100x100" }, default_url: 'http://s3.amazonaws.com/game-knight-user-avatars/default-avatar.jpg'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_attachment_file_name :avatar, matches: [/png\Z/, /jpe?g\Z/]

end

# default avatar URL: http://s3.amazonaws.com/game-knight-user-avatars/default-avatar.jpg
