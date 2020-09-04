class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :post_images, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :post_comments, dependent: :destroy
 
  # ① 承認している人取得(Userのapproverから見た関係)
  has_many :approver, class_name: "approval", foreign_key: "approver_id", dependent: :destroy
  # ② 承認されている人取得(Userのapproveredから見た関係)
  has_many :approvered, class_name: "approval", foreign_key: "approvered_id", dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :shippings, dependent: :destroy
  has_many :cart_images, dependent: :destroy
  has_many :orders, dependent: :destroy
  validates :name, presence: true, length: {minimum: 2, maximum: 20}
end
