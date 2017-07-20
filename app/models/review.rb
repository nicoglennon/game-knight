class Review < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  belongs_to :game

  validates :body, presence: true
end

