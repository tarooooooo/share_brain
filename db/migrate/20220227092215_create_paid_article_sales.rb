class CreatePaidArticleSales < ActiveRecord::Migration[6.1]
  def change
    create_table :paid_article_sales do |t|
      t.references :seller, null: false, foreign_key: { to_table: :users }
      t.references :paid_article_order, null: false, foreign_key: true
      t.float :fee_rate, null: false
      t.integer :fee, null: false

      t.timestamps
    end
  end
end
