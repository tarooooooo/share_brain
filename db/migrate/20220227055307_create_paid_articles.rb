class CreatePaidArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :paid_articles do |t|
      t.references :seller, null: false, foreign_key: { to_table: :users }
      t.string :title, null: false
      t.text :content, null: false
      t.integer :price, null: false, default: 0
      t.datetime :published_at
      t.integer :publish_status, null: false, default: 0
      t.string :main_image, null: false, default: 0
      t.string :attachment_file, default: 0

      t.timestamps
    end
  end
end
