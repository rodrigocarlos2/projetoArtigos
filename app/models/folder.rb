class Folder < ActiveRecord::Base
  belongs_to :user
  has_many :examples, :dependent => :destroy
  has_many :folder_users, :dependent => :destroy

  validates :name, :presence => true
end
