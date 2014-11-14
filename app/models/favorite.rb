class Favorite < ActiveRecord::Base
	include Statusable
	belongs_to :user
	belongs_to :post
	

end
