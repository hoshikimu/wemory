class PostImage < ApplicationRecord
  attachment :image
  belongs_to :user
  belongs_to :category, optional: true
  has_many :favorites, dependent: :destroy
  has_many :cart_images, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  validates :image, presence: true
  validates :introduction, length: {maximum: 30}

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def cart_added_by?(user)
    cart_images.where(user_id: user.id).exists?
  end
end
