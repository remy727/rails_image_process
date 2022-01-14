class Upload < ApplicationRecord
  include ImageUploader::Attachment(:image)
end
