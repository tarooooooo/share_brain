class ArticleKnowledgeTag < ApplicationRecord
  belongs_to :knowledge_tag
  belongs_to :article
end
