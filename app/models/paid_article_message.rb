class PaidArticleMessage < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :paid_article
end
