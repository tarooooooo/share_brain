class CreatePaidArticleContets < ActiveRecord::Migration[6.1]
  def change
    create_table :paid_article_contets do |t|
      t.references :paid_article, null: false, foreign_key: true
      t.string :main_image
      t.string :movie_id
      t.text :content


      t.timestamps
    end
  end
end
