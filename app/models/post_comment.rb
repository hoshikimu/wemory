class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post_image
  validates :comment, presence: true, length: {maximum: 100}
  has_many :notifications, dependent: :destroy
end