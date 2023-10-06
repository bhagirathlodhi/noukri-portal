class Job < ApplicationRecord
  paginates_per 5
  #self.per_page = 5

  belongs_to :user
  has_many :requests, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }
  validates :salary, presence: true, length: { maximum: 12 }
  validates :location, presence: true, length: { maximum: 56 }
  validates :skills, presence: true, length: { maximum: 120 }
  
end
