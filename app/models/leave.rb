class Leave < ApplicationRecord
  enum leave_type: [:half, :full]
  validates_presence_of :start_date, :end_date
  belongs_to :reason
end
