class Topic < ApplicationRecord
  belongs_to :forum
  belongs_to :user
  has_many :posts, dependent: :destroy

  validates :title, presence: true, uniqueness: true
end
