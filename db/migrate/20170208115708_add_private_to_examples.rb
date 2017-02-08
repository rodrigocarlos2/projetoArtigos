class AddPrivateToExamples < ActiveRecord::Migration
  def change
    add_column :examples, :private, :boolean
  end
end
