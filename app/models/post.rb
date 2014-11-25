# Post model
#
# == License
# Code is owned by Kari
# Fields include id, title, description, rank
# user_id, post_id, status, created_at, updated_at
class Post < ActiveRecord::Base
  include Statusable
  belongs_to :topic
  belongs_to :user
  has_many :comments
  validates :title, length: { maximum: 255 }
  validates :description, length: { maximum: 65_535 }
  validates :rank, numericality: true
end
