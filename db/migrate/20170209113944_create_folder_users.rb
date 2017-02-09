class CreateFolderUsers < ActiveRecord::Migration
  def change
    create_table :folder_users do |t|
      t.references :folder, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
