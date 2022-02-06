class AddIconImageToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :icon_image, :string, after: :name, comment: 'アイコン画像'
  end
end
