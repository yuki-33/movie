class Work < ApplicationRecord
  mount_uploader :image, WorkImageUploader
  belongs_to :director
  has_many :work_tags, dependent: :destroy
  has_many :tags, through: :work_tags

  acts_as_list

  validates :title, presence: true
  scope :by_position, ->{ order(position: :asc)}
  scope :by_release, ->{ order(release: :asc) }

  def related_works
    director.works.where.not(id: id)
  end
end
