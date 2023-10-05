class Request < ApplicationRecord
  belongs_to :job
  belongs_to :user

  has_one_attached :resume

  validates :name, presence: true
  validates :email, presence: true
  validates :contact_number, presence: true
  #validates :email, uniqueness: true

  enum status: [:pending, :accepted, :rejected]
end
