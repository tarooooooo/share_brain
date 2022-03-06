class PaidArticleContent < ApplicationRecord
  mount_uploader :main_image, PaidArticleContentMainImageUploader
  belongs_to :paid_article
end
