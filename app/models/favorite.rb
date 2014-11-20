# Favorite model
#
# == License
# Code is owned by Kari
# Fields include id, user_id, post_id, status, created_at, updated_at
class Favorite < ActiveRecord::Base
  include Statusable
  belongs_to :user
  belongs_to :post
end
