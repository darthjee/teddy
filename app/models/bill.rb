class Bill < ApplicationRecord
  default_scope { where(active: true) }
  scope :from_date, -> (date) { where('start_date <= ? or start_date is null', date)}
  scope :to_date, -> (date) { where('end_date <= ? or end_date is null', date)}
  scope :for_month, -> (date) { from_date(date.beginning_of_month).to_date(date.end_of_month) }
end
