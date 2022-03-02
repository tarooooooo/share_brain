class PaidArticleSale < ApplicationRecord
  belongs_to :paid_article_order

  class << self
    def create_now(order)
      paid_article = order.paid_article
      seller = paid_article.seller
      fee_rate = 0.1
      fee = paid_article.price
      PaidArticleSale.create!(
        seller_id: seller.id,
        paid_article_order: order,
        fee_rate: fee_rate,
        fee: fee
      )
    end
  end
end
