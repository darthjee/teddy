class Payment < ApplicationRecord
  belongs_to :bill

  validates_presence_of :due_date, :bill
end
