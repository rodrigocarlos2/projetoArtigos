class Example < ActiveRecord::Base
     mount_uploader :my_file, FileUploader
     belongs_to :folder

     validates :name, :presence => true
     validates :my_file, :presence => true
end
