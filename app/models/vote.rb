# Vote model
#
# == License
# Code is owned by Kari
# Fields include id, value,
# user_id, post_id, status, created_at, updated_at
class Vote < ActiveRecord::Base
  include Statusable
  belongs_to :user
  belongs_to :post
  validates :value, presence: true, numericality: true
end
