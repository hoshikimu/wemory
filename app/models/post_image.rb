class PostImage < ApplicationRecord
  attachment :image
  belongs_to :user
  belongs_to :category, optional: true
  has_many :favorites, dependent: :destroy
  has_many :cart_images, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  validates :image, presence: true
  validates :introduction, length: {maximum: 30}

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def cart_added_by?(user)
    cart_images.where(user_id: user.id).exists?
  end

  def create_notification_like(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and post_image_id = ? and action = ? ", current_user.id, user_id, id, 'like'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: user_id,
        post_image_id: id,
        action: "like"
        )
        if notification.visitor_id == notification.visited_id
          notification.checked = true
        end
        notification.save!
    end
  end
end
