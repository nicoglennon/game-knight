class Forum < ApplicationRecord
  has_many :topics, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
