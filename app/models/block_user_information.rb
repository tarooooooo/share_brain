class BlockUserInformation < ApplicationRecord
  belongs_to :user

  validates :user_id, uniqueness: true

  enum status: {
    blocked: 0,
    unblocked: 1
  }
end
