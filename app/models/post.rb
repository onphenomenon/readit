# Post model
#
# == License
# Code is owned by Kari
# Fields include id, title, description, rank
# user_id, post_id, status, created_at, updated_at
class Post < ActiveRecord::Base
  attr_accessor :post_id, :image
  include Statusable
  belongs_to :topic
  belongs_to :user
  has_many :comments
  has_many :votes
  has_many :favorites
  validates :title, presence: true, length: { maximum: 255 }
  validates :description, presence: true,  length: { maximum: 65_535 }
  mount_uploader :image, ImageUploader
  # validates :rank, numericality: true
end
