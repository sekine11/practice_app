class QuestionComment < ApplicationRecord
    validates :comment, length: { maximum: 500 }
    belongs_to :user
    belongs_to :question
end
