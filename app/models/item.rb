class Item < ApplicationRecord
    has_many :likes, dependent: :destroy
    has_many :logs, dependent: :destroy
    belongs_to :user
    belongs_to :category

    attachment :image

    validates :user_id, presence: true
    validates :category_id, presence: true
    validates :name, presence: true
    validates :infomation, presence: true

end