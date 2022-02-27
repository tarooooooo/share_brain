class PaidArticleSale < ApplicationRecord
  belongs_to :seller, class_name:'User'
  belongs_to :PaidArticleOrder
end
