class CalendarController < ApplicationController
  include Common::User
  include Common::Redirection

  delegate :beginning_of_month, :end_of_month, to: :month_date

  DAYS_PER_WEEK=7

  def index
    render_basic
  end

  private

  def index_json
    {
      first_date: beginning_of_month,
      last_date: end_of_month
    }
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
