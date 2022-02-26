class KnowledgeTag < ApplicationRecord
  has_many :article_knowledge_tags, dependent: :destroy
  has_many :articles, through: :article_knowledge_tags

  validates :name, presence: true, uniqueness: true
end
