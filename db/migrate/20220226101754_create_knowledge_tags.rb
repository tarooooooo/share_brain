class CreateKnowledgeTags < ActiveRecord::Migration[6.1]
  def change
    create_table :knowledge_tags do |t|
      t.string :name, index: { unique: true }, null:false

      t.timestamps
    end
  end
end
