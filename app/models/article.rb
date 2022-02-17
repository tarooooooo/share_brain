class Article < ApplicationRecord
  belongs_to :writer, class_name:'User'
  enum publish_status: {
    draft: 0,
    published: 99

  }

  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true

end
