class Item < ApplicationRecord
    has_many :likes, dependent: :destroy
    has_many :logs, dependent: :destroy
    has_many :comments, through: :logs
    belongs_to :user
    belongs_to :category

    attachment :image

    validates :user_id, presence: true
    validates :category_id, presence: true
    validates :name, presence: true, length: { maximum: 30, message: "30字以内で入力してください。" }
    validates :infomation, presence: true, length: { maximum: 500, message: "500字以内で入力してください。" }
    validates :score, presence: true
    validates :price, numericality: { only_integer: true,  message: "正しい金額を入力してください。" }

end