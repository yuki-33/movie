class Profile < ApplicationRecord
  mount_uploader :image, WorkImageUploader
  belongs_to :user
end
