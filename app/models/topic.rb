# Topic model
#
# == License
# Code is owned by Kari
# Fields include id, title, description,
# status, created_at, updated_at
class Topic < ActiveRecord::Base
  attr_accessor :image
  include Statusable
  has_many :posts
  validates :title, length: { maximum: 255 }, presence: true
  validates :description, length: { maximum: 65_535 }
  mount_uploader :image, ImageUploader
end
