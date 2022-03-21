class CreateArticleKnowledgeTags < ActiveRecord::Migration[6.1]
  def change
    create_table :article_knowledge_tags do |t|
      t.references :article, index: true, null: false, foreign_key: true
      t.references :knowledge_tag, index: true, null: false, foreign_key: true

      t.timestamps
    end
  end
end
