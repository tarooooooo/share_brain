class PaidArticleNotification < ApplicationRecord
  belongs_to :paid_article
  belongs_to :writer, class_name: 'User'

  scope :published, -> { where('paid_article_notifications.published_at <= ?', Time.current) }
  scope :pre_publication, -> { where('paid_article_notifications.published_at > ?', Time.current) }
end
