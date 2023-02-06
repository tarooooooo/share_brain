class Article < ApplicationRecord
  has_many :article_knowledge_tags, dependent: :destroy
  has_many :knowledge_tags, through: :article_knowledge_tags
  has_one :content_data, dependent: :destroy, class_name: 'ArticleContentDatum'
  belongs_to :writer, class_name:'User'

  enum status: {
    free: 0,
    paid: 1
  }, _prefix: true

  enum publish_status: {
    draft: 0,
    published: 10,
    close: 99
  }, _prefix: true

  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true

  delegate :name, to: :writer, prefix: true

end
