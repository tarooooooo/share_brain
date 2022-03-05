class CreatePaidArticleContents < ActiveRecord::Migration[6.1]
  def change
    create_table :paid_article_contents do |t|
      t.references :paid_article, index: { unique: true }, null: false, foreign_key: true
      t.string :main_image, null: false
      t.string :movie_id
      t.text :body

      t.timestamps
    end
  end
end
