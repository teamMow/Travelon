class Article < ApplicationRecord
	validates :title, presence: true
	validates :content, presence: true
	validates :area, presence: :true

	belongs_to :user

	mount_uploader :img, ImageUploader

	has_many :likes, dependent: :destroy

	# いいねしているかどうか？
	def liked_by? user
		likes.where(user_id: user.id).exists?
	end
end

