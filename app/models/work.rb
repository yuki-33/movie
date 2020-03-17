class Work < ApplicationRecord
  validates :title, presence: true
  scope :by_id, ->{ order(id: :asc) }
end
