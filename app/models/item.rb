class Item < ApplicationRecord
    has_many :likes
    has_many :logs
    belongs_to :user
    belongs_to :category

    attachment :image

    validates :user_id, presence: true
    validates :category_id, presence: true
    validates :name, presence: true
    validates :infomation, presence: true
    validates :open_range, presence: true

end