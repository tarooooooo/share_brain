class RenameContentColumnToPaidArticles < ActiveRecord::Migration[6.1]
  def change
    rename_column :paid_articles, :content, :body
  end
end
