class CalendarController < ApplicationController
  include Common::User
  include Common::Redirection

  delegate :beginning_of_month, :end_of_month, to: :month_date

  DAYS_PER_WEEK=7

  def index
    @days = (beginning_of_month..end_of_month).to_a
    render_basic
  end

  private

  def index_json
    @days.as_json
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
