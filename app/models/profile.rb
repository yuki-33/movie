class Profile < ApplicationRecord
  # mount_uploader :image, WorkImageUploader
  has_one_attached :image
  belongs_to :user

  def full_name
    "#{first_name} #{last_name}"
  end
end
