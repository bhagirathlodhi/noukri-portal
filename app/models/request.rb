class Request < ApplicationRecord
  paginates_per 10

  belongs_to :job

  has_one_attached :resume

  validates :name, presence: true
  validates :email, presence: true
  validates :contact_number, presence: true
  #validates :email, uniqueness: true

  enum status: [:pending, :accepted, :rejected]
end
