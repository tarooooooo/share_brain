class CreateArticleContentData < ActiveRecord::Migration[6.1]
  def change
    create_table :article_content_data do |t|
      t.references :article, index: { unique: true }, null: false, foreign_key: true, comment: '記事ID'
      t.text :summary, null: false, comment: '商品概要'
      t.integer :price, null: false, comment: '価格'

      t.timestamps
    end
  end
end
