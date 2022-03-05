class CreatePaidArticleMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :paid_article_messages do |t|
      t.references :sender, null: false, foreign_key: { to_table: :users }
      t.references :paid_article, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.integer :publish_status, null: false, default: 0

      t.timestamps
    end
  end
end
