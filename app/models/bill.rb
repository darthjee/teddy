class Bill < ApplicationRecord
  scope :active, -> { where(active: true) }
  scope :starts_before, -> (date) { where('start_date <= ? or start_date is null', date)}
  scope :ends_after, -> (date) { where('end_date >= ? or end_date is null', date)}
  scope :for_month, -> (date) { starts_before(date.end_of_month).ends_after(date.beginning_of_month) }
end
