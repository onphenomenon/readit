class Comment < ActiveRecord::Base
	include Statusable

	belongs_to :user
	belongs_to :post
	validates :description, length: {maximum:65535}
	
end
