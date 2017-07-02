class Bill < ApplicationRecord
  has_many :payments
  belongs_to :user

  scope :active, -> { where(active: true) }
  scope :starts_before, -> (date) { where('start_date <= ? or start_date is null', date)}
  scope :ends_after, -> (date) { where('end_date >= ? or end_date is null', date)}
  scope :for_month, -> (date) { starts_before(date.end_of_month).ends_after(date.beginning_of_month) }

  validates_presence_of :day, :user

  def build_payment(month_date = Date.today)
    due_date = (month_date.beginning_of_month - 1.day) + day.days
    payments.build(due_date: due_date)
  end

  def create_payment(month_date = Date.today)
    build_payment(month_date).tap(&:save)
  end
end
