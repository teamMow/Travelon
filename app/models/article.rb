class Article < ApplicationRecord
	validates :title, presance: true
	validates :content, presance: true
	validates :area, presance :true

	# belongs_to :user

	belongs_to :user
	
	mount_uploader :img, ImageUploader
end
