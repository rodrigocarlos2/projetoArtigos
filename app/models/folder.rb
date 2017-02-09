class Folder < ActiveRecord::Base
  belongs_to :user
  has_many :examples, :dependent => :destroy

  validates :name, :presence => true
end
