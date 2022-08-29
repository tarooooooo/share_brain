class PaidArticleNotification < ApplicationRecord
  belongs_to :paid_article
  belongs_to :writer, class_name: 'User'

  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 1000 }
  validates :published_at, presence: true

  scope :published, -> { where('paid_article_notifications.published_at <= ?', Time.current) }
  scope :pre_publication, -> { where('paid_article_notifications.published_at > ?', Time.current) }
end
