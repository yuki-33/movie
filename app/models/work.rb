class Work < ApplicationRecord
  belongs_to :director

  acts_as_list

  validates :title, presence: true
  scope :by_position, ->{ order(position: :asc)}
  scope :by_id, ->{ order(id: :asc) }

  def related_works
    director.works.where.not(id: id)
  end
end
