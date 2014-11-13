class Topic < ActiveRecord::Base

	has_many :posts
	enum status: [:active, :inactive, :deleted]
	validates :title, length: { maximum: 255 }
	validates :description, length: {maximum: 65535}
	validates :status, presence: true, allow_nil: false
end
