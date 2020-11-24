class Contact
  include ActiveModel::Model
  attr_accessor :name, :email, :text

  validates :name, presence: true
  validates :text, presence: true

  # def persisted? ; false ; end
end
