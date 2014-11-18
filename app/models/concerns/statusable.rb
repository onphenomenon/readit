module Statusable
  extend ActiveSupport::Concern

  included do
    enum status: [:active, :inactive, :deleted]
    validates :status, presence: true, allow_nil: false

    scope :active, -> { where(status: 0) }
  end

end
