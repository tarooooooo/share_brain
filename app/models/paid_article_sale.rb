class PaidArticleSale < ApplicationRecord
  belongs_to :paid_article_order

  class << self
    def create_now(paid_article_order:)
      paid_article = paid_article_order.paid_article
      seller = paid_article.seller
      fee_rate = 0.1
      fee = paid_article.price
      PaidArticleSale.create!(
        seller_id: seller.id,
        paid_article_order: paid_article_order,
        fee_rate: fee_rate,
        fee: fee
      )
    end

    def article_sale_create_now!(article_order:)
      article = article_order.article
      seller = article.writer
      fee_rate = 0.1
      fee = article.content_data.price
      PaidArticleSale.create!(
        seller_id: seller.id,
        paid_article_order: article_order,
        fee_rate: fee_rate,
        fee: fee
      )
    end
  end
end
