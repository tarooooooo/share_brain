class PaidArticle < ApplicationRecord
  include AASM

  mount_uploader :main_image, PaidArticleMainImageUploader
  mount_uploader :attachment_file, PaidArticleAttachmentFileUploader

  belongs_to :seller, class_name: 'User'
  has_one :content, class_name: 'PaidArticleContent', dependent: :destroy

  enum publish_status: {
    draft: 0,
    published: 10,
    close: 99
  }, _prefix: true

  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 100, less_than_or_equal_to: 100000 }
  validates :main_image, presence: true

  delegate :name, to: :seller, prefix: true

  aasm column: :publish_status, enum: true do
    state :draft, initial: true
    state :published
    state :close

    event :draft do
      transitions from: :published, to: :draft
    end

    event :published do
      transitions from: [:draft, :close], to: :published
    end

    event :close do
      transitions from: :published, to: :close
    end
  end

  def time_current_in_published_at
    if published_at.blank?
      t = Time.current
      sec_per_min = 60
      self.published_at = Time.zone.at(t.to_i / sec_per_min * sec_per_min)
    end
  end

  class << self
    def create_from!(article:)
      seller = article.writer
      title = article.title
      body = article.content
      price = article.content.price
      published_at = article.published_at

      PaidArticle.create!(
        seller_id: seller.id,
        title: title,
        body: body,
        price: price,
        published_at: published_at
      )
    end
  end
end
