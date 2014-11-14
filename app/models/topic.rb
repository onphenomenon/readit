class Topic < ActiveRecord::Base
	include Statusable
	
	has_many :posts
	validates :title, length: { maximum: 255 }
	validates :description, length: {maximum: 65535}
	
end
