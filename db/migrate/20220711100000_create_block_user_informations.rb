class CreateBlockUserInformations < ActiveRecord::Migration[6.1]
  def change
    create_table :block_user_informations do |t|
      t.references :user, null: false, foreign_key: true, index: { unique: true }
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
