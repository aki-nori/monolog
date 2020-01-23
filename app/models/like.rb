class Like < ApplicationRecord
    belongs_to :likes

    validates :user_id, presence: true
    validates :item_id, presence: true
end
