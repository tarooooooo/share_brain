class PaidArticleOrder < ApplicationRecord
  belongs_to :buyer, class_name:'User'
  belongs_to :paid_article
  has_one :paid_article_sale

  validates :payment_method, presence: true

  enum payment_method: {
    credit_card: 0,
    bank_transfer: 1
  }
end
