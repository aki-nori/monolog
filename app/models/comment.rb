class Comment < ApplicationRecord
	belongs_to :log
	belongs_to :user

    validates :log_id, presence: true
    validates :user_id, presence: true
    validates :body, presence: true
end
