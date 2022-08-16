class PaidArticleNotification < ApplicationRecord
  belongs_to :paid_article
  belongs_to :writer, class_name: 'User'
end
