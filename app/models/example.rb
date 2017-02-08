class Example < ActiveRecord::Base
     mount_uploader :my_file, FileUploader
     
     belongs_to :folder
     
     searchkick
end
