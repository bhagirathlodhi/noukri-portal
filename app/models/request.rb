class Request < ApplicationRecord
  belongs_to :job

  validates :name, presence: true
  #validates :skills, presence: true

 validates :status, inclusion: { in: %w(pending accepted rejected) }

 #enum :status, [ :pending, :accept, :reject ]


end
