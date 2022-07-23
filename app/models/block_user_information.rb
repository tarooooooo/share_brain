class BlockUserInformation < ApplicationRecord
  include AASM
  belongs_to :user

  validates :user_id, uniqueness: true

  enum status: {
    blocked: 0,
    unblocked: 1
  }

  aasm column: :status, enum: true do
    state :blocked, initial: true
    state :unblocked

    event :block do
      transitions from: :unblocked, to: :blocked
    end

    event :unblock do
      transitions from: :blocked, to: :unblocked
    end
  end
end
