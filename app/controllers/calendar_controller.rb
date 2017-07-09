class CalendarController < ApplicationController
  include Common::User
  include Common::Redirection

  delegate :beginning_of_month, :end_of_month, to: :month_date
  before_action :build_payments, only: :index

  DAYS_PER_WEEK=7

  def index
    render_basic
  end

  private

  def distant_date?
    month_date.days_between(Date.today) < 365
  end

  def index_json
    {
      first_date: beginning_of_month,
      last_date: end_of_month,
      payments: payments
    }
  end

  def build_payments
    return unless distant_date?
    bills_without_payment.each { |b| b.create_payment(month_date) }
  end

  def bills_without_payment
    bills.without_payment_for_month(month_date)
  end

  def payments
    @payments ||= fetch_payments
  end

  def fetch_payments
    created_payments + built_payments
  end

  def built_payments
    bills_without_payment.map { |b| b.build_payment(month_date) }
  end

  def created_payments
    Payment.period(month_date).where(bill_id: bills.pluck(:id))
  end

  def bills
    @bills ||= logged_user.bills.active.for_month(month_date)
  end

  def month_date
    @month_date ||= Date.new(year, month, 1)
  end

  def month
    @month ||= params.require(:month).to_i
  end

  def year
    @year ||= params.require(:year).to_i
  end
end
