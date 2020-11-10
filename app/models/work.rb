class Work < ApplicationRecord
  has_one_attached :image

  attr_accessor :image_blob_id

  belongs_to :director
  has_many :work_tags, dependent: :destroy
  has_many :tags, through: :work_tags

  validates :title, presence: true
  scope :by_position, ->{ order(position: :asc)}
  scope :by_release, ->{ order(release: :asc) }

  def related_works
    director.works.where.not(id: id)
  end
end
