class Experience < ActiveRecord::Base
  belongs_to :resume
  validates :company_name, :designation, :job_description, :start_date, presence: true

end
