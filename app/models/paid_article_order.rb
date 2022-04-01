class PaidArticleOrder < ApplicationRecord
  validate :required_either_paid_article_or_article

  belongs_to :buyer, class_name:'User'
  belongs_to :paid_article, optional: true
  has_one :paid_article_sale
  belongs_to :article, optional: true

  validates :paid_article, presence: true, if: :paid_article_id?
  validates :article, presence: true, if: :article_id?
  validates :payment_method, presence: true

  enum payment_method: {
    credit_card: 0,
    bank_transfer: 1
  }

  def required_either_paid_article_or_article
    return if paid_article_id.present? ^ article_id.present?

    errors.add(:base, '商品または、記事のどちらか一方を購入してください')
  end
end
