class Log < ApplicationRecord
    belongs_to :item
    has_many :comments , dependent: :destroy

    attachment :image

    validates :item_id, presence: true
    validates :title, presence: true
    validates :body, presence: true
    validates :from, presence:true
    # validates :status, presence: true

    enum from: { user: 1, system: 2 }
end
