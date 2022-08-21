module PaidArticleOrders
  class CreateWorkflow < ::ActiveInteraction::Base
    record :paid_article_order
    record :paid_article

    def execute
      ActiveRecord::Base.transaction do
        paid_article_order.paid_article = paid_article
        paid_article_order.save!

        PaidArticleSale.create_now(paid_article_order: paid_article_order)
      end
    end
  end
end
