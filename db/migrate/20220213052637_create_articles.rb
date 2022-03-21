class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.references :writer,null: false, foreign_key: { to_table: :users }, comment: 'ユーザーID'
      t.string :title, null: false
      t.text :content, null: false
      t.datetime :published_at
      t.integer :publish_status, null: false, default: 0

      t.timestamps
      t.datetime :deleted_at
    end
  end
end
