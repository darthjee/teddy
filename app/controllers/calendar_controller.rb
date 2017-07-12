class CalendarController < ApplicationController
  include Common::User
  include Common::Redirection

  delegate :distant_date?, to: :calendar
  before_action :build_payments, only: :index

  DAYS_PER_WEEK=7

  def index
    render_basic
  end

  private

  def index_json
    Serializers::Calendar.new(calendar).as_json(include: 'payments.bill')
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
