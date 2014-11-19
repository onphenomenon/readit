class Vote < ActiveRecord::Base
  include Statusable
  belongs_to :user
  belongs_to :post
  validates :value, presence: true, numericality: true
end
