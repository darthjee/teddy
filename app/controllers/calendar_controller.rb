class CalendarController < ApplicationController
  include Common::User
  include Common::Redirection

  delegate :month_date, :distant_date?, :payments, to: :calendar
  delegate :beginning_of_month, :end_of_month, to: :month_date
  before_action :build_payments, only: :index

  DAYS_PER_WEEK=7

  def index
    render_basic
  end

  private

  def index_json
    {
      first_date: beginning_of_month,
      last_date: end_of_month,
      payments: payments
    }
  end

  def build_payments
    return unless distant_date?
    calendar.build_payments
  end

  def calendar
    Calendar.new(year, month, logged_user)
  end

  def month
    @month ||= params.require(:month).to_i
  end

  def year
    @year ||= params.require(:year).to_i
  end
end
