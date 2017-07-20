class Review < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: :author_id
  belongs_to :game

  validates :body, :title, presence: true
  # what do we think about limiting the length of a review?
end

