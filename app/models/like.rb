class Like < ApplicationRecord
	validates :user, presence: true
	validates :user_id, uniqueness: { scope: :article_id }
	validates :article, presence: true

	belongs_to :article
	belongs_to :user
end
