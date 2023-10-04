class Job < ApplicationRecord
  belongs_to :user
  has_many :requests, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }
  validates :salary, presence: true, length: { maximum: 12 }
  validates :location, presence: true, length: { maximum: 56 }
  validates :skills, presence: true, length: { maximum: 120 }
  
end
