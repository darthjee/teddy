class Calendar
  attr_reader :year, :month, :user

  def initialize(year, month, user)
    @year = year
    @month = month
    @user = user
  end

  def build_payments
    bills_without_payment.each { |b| b.create_payment(month_date) }
  end

  def payments
    @payments ||= fetch_payments
  end

  def distant_date?
    month_date.days_between(Date.today) < 365
  end

  def month_date
    @month_date ||= Date.new(year, month, 1)
  end

  private

  def bills_without_payment
    bills.without_payment_for_month(month_date)
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
    @bills ||= user.bills.active.for_month(month_date)
  end
end
