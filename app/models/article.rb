class Article < ApplicationRecord
  belongs_to :writer, class_name:'User'
  enum publish_status: {
    draft: 0,
    published: 10,
    close: 99
  }, _prefix: true

  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true

  delegate :name, to: :writer, prefix: true

end
