# Vote model
#
# == License
# Code is owned by Kari
# Fields include id, value,
# user_id, post_id, status, created_at, updated_at
class Vote < ActiveRecord::Base
  include Statusable
  attr_accessor :post_id, :up
  belongs_to :user
  belongs_to :post
  validates :user, presence: true
  validates :post, presence: true
  validates :value, presence: true, numericality: true
  # check that only one vote per user per post
  validate :user_can_vote

  def already_voted?(user, post)
    return true if Vote.where(user_id: user.id, post_id: post.id).any?

    false
  end

  private

  def user_can_vote
    return unless already_voted?(self.user, self.post)

    errors.add(:post, :already_voted)
  end
end
