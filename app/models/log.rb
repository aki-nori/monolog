class Log < ApplicationRecord
    validates :item_id, presence: true
    validates :title, presence: true
    validates :body, presence: true
    validates :status, presence: true
end
