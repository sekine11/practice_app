class Question < ApplicationRecord
    acts_as_taggable_on :labels # post.label_list が追加される
    acts_as_taggable            # acts_as_taggable_on :tags のエイリアス
    acts_as_ordered_taggable_on :categories
    validates :subject, presence: true
    validates :content, presence: true
	validates :subject, length: { maximum: 50 }
	validates :content, length: { maximum: 1000 }
    belongs_to :user
end
