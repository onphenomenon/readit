module Statusable
  extend ActiveSupport::Concern

  included do
    enum status: [:active, :inactive, :deleted]
    validates :status, presence: true, allow_nil: false
    scope :active, -> { where(status: :active) }
    #scope :active, -> { where(deleted_at: nil) }
  end
end
