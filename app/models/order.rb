class Order < ApplicationRecord
  mount_uploader :file, FileUploader
end
