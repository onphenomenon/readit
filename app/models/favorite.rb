class Favorite < ActiveRecord::Base
	belongs_to :user
	belongs_to :post
	enum status: [:active, :inactive, :deleted]
end
