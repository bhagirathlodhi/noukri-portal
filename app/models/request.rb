class Request < ApplicationRecord
  belongs_to :job

  validates :name, presence: true
  validates :email, presence: true
  validates :contact_number, presence: true

  enum status: [:pending, :accepted, :rejected]

end
