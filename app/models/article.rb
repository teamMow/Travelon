class Article < ApplicationRecord
	validates :title, presence: true
	validates :content, presence: true
	# validates :area, presence: :true

	belongs_to :user

	mount_uploader :img, ImageUploader


end
