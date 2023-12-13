class Request < ApplicationRecord
  paginates_per 10

  belongs_to :job

  has_one_attached :resume

  validates :name, presence: true
  validates :email, presence: true
  validates :contact_number, presence: true
  validates :job_id, presence:true
  validates :resume, presence:true
  validate :is_pdf



  enum status: [:pending, :accepted, :rejected]

  private

    def is_pdf
       if resume.attached? && !resume.content_type.in?("application/pdf")
        errors.add(:resume, 'Resume should be PDF!')
      end
    end

  
end
