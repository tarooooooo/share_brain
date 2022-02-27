class PaidArticleOrder < ApplicationRecord
  belongs_to :buyer, class_name:'User'
  belongs_to :paid_article

  validates :payment_method, presence: true

  enum payment_method: {
    credit_card: 0,
    bank_transfer: 1
  }
end
