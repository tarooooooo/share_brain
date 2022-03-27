class AddArticleIdToPaidArticleOrder < ActiveRecord::Migration[6.1]
  change_table :paid_article_orders, bulk: true do |t|
    t.references :article, foreign_key: true, after: :buyer_id, comment: '記事ID'
  end
end
