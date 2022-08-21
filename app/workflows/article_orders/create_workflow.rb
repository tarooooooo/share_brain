module ArticleOrders
  class CreateWorkflow < ::ActiveInteraction::Base
    record :paid_article_order
    record :article

    def execute
      ActiveRecord::Base.transaction do
        paid_article_order.article = article
        paid_article_order.save!

        PaidArticleSale.article_sale_create_now!(article_order: paid_article_order)
      end
    end
  end
end
