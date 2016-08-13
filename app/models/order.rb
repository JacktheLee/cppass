require 'yomu'

class Order < ApplicationRecord
  belongs_to :user
  mount_uploader :file, FileUploader

  def count_pages
    yomu = Yomu.new self.file_url
    return yomu.metadata['xmpTPg:NPages']
  end
end
