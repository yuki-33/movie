class Director < ApplicationRecord
  validates :name, presence: true
  scope :by_id, ->{ order(id: :asc) }
end
