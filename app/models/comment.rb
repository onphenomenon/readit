# Comment model
#
# == License
# Code is owned by Kari
# Fields include id, description, user_id, post_id,
# status, created_at, updated_at
class Comment < ActiveRecord::Base
  include Statusable
  belongs_to :user
  belongs_to :post
  has_one :topic, through: :post
  validates :description, length: { maximum: 65_535 }
  validates :user_id, presence: true
  validates :post_id, presence: true
end
