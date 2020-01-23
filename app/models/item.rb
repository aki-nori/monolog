class Item < ApplicationRecord
    has_many :likes
    belongs_to :user
    belogns_to :category

    validates :user_id, presence: true
    validates :category_id, presence: true
    validates :name, presence: true
    validates :infomation, presence: true
    validates :open_range, presence: true
end