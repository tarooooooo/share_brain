class CreatePaidArticleOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :paid_article_orders do |t|
      t.references :buyer, null: false, foreign_key: { to_table: :users }
      t.references :paid_article, null: false, foreign_key: true
      t.integer :payment_method, default: 0, null: false

      t.timestamps
    end
  end
end
