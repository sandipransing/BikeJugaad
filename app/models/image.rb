require 'file_size_validator'
class Image
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :vehicle
  mount_uploader :photo, PhotoUploader
end
