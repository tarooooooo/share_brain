class Article < ApplicationRecord
  include AASM

  aasm column: :publish_status, enum: true do
    state :draft, initial: true
    state :reserved
    state :published
    state :canceled

    event :draft do
      transitions from: :published, to: :draft
    end

    event :reserved do
      transitions from: :draft, to: :reserved
    end

    event :published do
      transitions from: [:draft, :reserved], to: :published
    end

    event :canceled do
      transitions from: :published, to: :canceled
    end
  end

  belongs_to :writer, class_name:'User'
  enum publish_status: {
    draft: 0,
    reserved: 10,
    published: 20,
    canceled: 99
  }, _prefix: true

  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true

  delegate :name, to: :writer, prefix: true

end
