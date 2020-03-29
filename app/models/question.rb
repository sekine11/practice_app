class Question < ApplicationRecord
    validates :subject, presence: true
    validates :content, presence: true
	validates :subject, length: { maximum: 50 }
	validates :content, length: { maximum: 1000 }
    belongs_to :user
end
