class CreatePaidArticleNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :paid_article_notifications do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.references :writer, index: true, null: false, foreign_key: { to_table: :users }
      t.references :paid_article, index: true, null: false, foreign_key: true
      t.datetime :published_at, null: false

      t.timestamps
    end
  end
end
