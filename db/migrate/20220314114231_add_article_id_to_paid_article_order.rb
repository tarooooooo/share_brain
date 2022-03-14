class AddArticleIdToPaidArticleOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :paid_article_orders, :article_id, :reference, null: false, after: :buyer_id, comment: '記事ID'
  end
end
