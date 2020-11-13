class Director < ApplicationRecord
  has_one_attached :photo
  has_many_attached :images

  attr_accessor :photo_blob_id
  # attr_accessor :images_blob_id

  has_many :works
  validates :name, presence: true
  scope :by_id, ->{ order(id: :asc) }

  before_save :capitalize_name
  def capitalize_name
    self.name = self.name.split.map(&:capitalize).join(' ')
  end

end
