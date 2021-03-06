class Payment < ApplicationRecord
  belongs_to :bill

  scope :period, -> (start_of_month, end_of_month = nil) do
    unless end_of_month
      start_of_month = start_of_month.beginning_of_month
      end_of_month = start_of_month.end_of_month
    end

    where(due_date: (start_of_month..end_of_month))
  end

  validates_presence_of :due_date, :bill
end
