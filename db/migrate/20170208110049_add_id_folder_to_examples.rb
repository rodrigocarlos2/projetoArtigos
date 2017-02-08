class AddIdFolderToExamples < ActiveRecord::Migration
  def change
    add_reference :examples, :folder, index: true, foreign_key: true
  end
end
