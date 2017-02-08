class AddUserIdToExamples < ActiveRecord::Migration
  def change
    add_column :examples, :user_id, :integer
  end
end
