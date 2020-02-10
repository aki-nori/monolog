class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 自分がフォローしているユーザとの関連
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower

  # 自分がフォローされているユーザとの関連
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  has_many :items, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_items, through: :likes, source: :item

  has_many :comments, dependent: :destroy

  attachment :profile_image

  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true
  validates :introduction, length: { maximum: 150 }

  validates :twitter_account, format: { with: %r(https://(www.)?twitter.com/[^ ]*) }, allow_blank: true
  validates :instagram_account, format: { with: %r(https://(www.)?instagram.com/[^ ]*) }, allow_blank: true
  validates :facebook_account, format: { with: %r(https://(www.)?facebook.com/[^ ]*) }, allow_blank: true

  def already_liked?(item)
    self.likes.exists?(item_id: item.id)
  end

end
