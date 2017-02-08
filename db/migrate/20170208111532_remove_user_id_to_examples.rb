class RemoveUserIdToExamples < ActiveRecord::Migration
  def change
    remove_reference :examples, :user, index: true, foreign_key: true
  end
end
