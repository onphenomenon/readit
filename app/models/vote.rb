class Vote < ActiveRecord::Base
	include Statusable

	belongs_to :user
	belongs_to :post
	#should have value to be incremented
	validates :value, numericality: true
end
