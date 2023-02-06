class AddStatusToArticle < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :status, :integer, default: 0, null: false, after: :publish_status, comment: '種別： {"無料"=>0, "有料"=>1}'
  end
end
