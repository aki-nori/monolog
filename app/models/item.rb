class Item < ApplicationRecord
    has_many :likes, dependent: :destroy
    has_many :logs, dependent: :destroy
    has_many :comments, through: :logs
    belongs_to :user
    belongs_to :category

    attachment :image

    validates :user_id, presence: true
    validates :category_id, presence: true
    validates :name, presence: true, length: { maximum: 30 }
    validates :infomation, presence: true, length: { maximum: 500 }
    validates :score, presence: true
    validates :price, numericality: { only_integer: true }, allow_nil: true
    validates :maker, length: { maximum: 10 }

end