class Director < ApplicationRecord
  validates :name, presence: true
  scope :by_id, ->{ order(id: :asc) }

  before_save :capitalize_name
  def capitalize_name
    self.name = self.name.split.map(&:capitalize).join(' ')
  end
  
end
