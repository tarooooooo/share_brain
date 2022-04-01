class ChangePaidArticleIdToPaidArticleOrders < ActiveRecord::Migration[6.1]
  def up
    change_column :paid_article_orders, :paid_article_id,:bigint, null: true
  end

  def down
    change_column :paid_article_orders, :paid_article_id,:bigint, null: false
  end
end
