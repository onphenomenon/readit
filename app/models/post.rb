class Post < ActiveRecord::Base
	include Statusable

	belongs_to :topic
	belongs_to :user
	validates :title, length: { maximum:255}
	validates :description, length: { maximum:65535}
	validates :rank, numericality: true
	
end
