class Approval < ApplicationRecord
  belongs_to :approver, class_name: "User"
  belongs_to :approvered, class_name: "User"
  has_many :notifications, dependent: :destroy
  validates :permission_status, presence: true

  enum permission_status: {"閲覧者(アルバム注文不可)" => 0, "閲覧者(アルバム注文可)" => 1}

  def create_notification_approve(current_user)
    temp = Notification.where(visitor_id: current_user.id, visited_id: approvered_id, action: "approve")
    if temp.blank?
      notification = current_user.active_notifications.new(
      visited_id: approvered_id,
      permission_status: permission_status,
      action: "approve"
      )
      notification.save
    end
  end

  def create_notification_edit_approve(current_user)
    notification = current_user.active_notifications.new(
    visited_id: approvered_id,
    permission_status: permission_status,
    action: "edit_approve"
    )
    notification.save
  end
end
