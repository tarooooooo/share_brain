class CreateArticleContentData < ActiveRecord::Migration[6.1]
  def change
    create_table :article_content_data do |t|
      t.references :article, index: { unique: true }, null: false, foreign_key: true, comment: '記事ID'
      t.text :body, null: false, comment: '本文'
      t.integer :price, null: false, comment: '価格'
      t.datetime :published_at, comment: '公開日'
      t.integer :publish_status, null: false, default: 0, comment: '公開ステータス'
      t.integer :order, index: { unique: true}, null: false, comment: '並び替え番号'

      t.timestamps
    end
  end
end
