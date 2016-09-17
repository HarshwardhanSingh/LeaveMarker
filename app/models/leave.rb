class Leave < ApplicationRecord
  enum type: [:half, :full]
  validates_presence_of :start_date, :end_date
end
