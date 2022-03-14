module Articles
  class CreateContentDatumWorkflow < ::ActiveInteraction::Base
    record :article_content_datum
    record :article

    def execute
      ActiveRecord::Base.transaction do
        article_content_datum.save!
        article.status_paid!
      end
    end
  end
end
