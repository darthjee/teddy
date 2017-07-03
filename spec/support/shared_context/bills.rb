shared_examples 'a method that builds a payment for a given dare' do |method|
  let(:built_payment) { subject.public_send(method, month_date + 1.month) }
  let(:beginning_of_month) { month_date.beginning_of_month }
  let(:end_of_month) { month_date.end_of_month }

  it do
    expect(subject.public_send(method, month_date)).to be_a(Payment)
  end

  it 'builds for the same day' do
    expect(built_payment.due_date.day).to eq(subject.day)
  end

  it 'does not create for current date' do
    expect(built_payment.due_date).not_to be_between(beginning_of_month, end_of_month)
  end

  it 'creates for month given date' do
    expect(built_payment.due_date).to be_between(beginning_of_month + 1.month, end_of_month + 1.month)
  end

  context 'when date is not supplied' do
    it 'creates for the current month' do
      expect(subject.public_send(method).due_date).to be_between(beginning_of_month, end_of_month)
    end
  end
end

shared_examples 'without_payment_for_month does not return the bill' do
  it 'does not return the bill' do
    expect(bills).not_to include(bill)
  end
end

shared_examples 'without_payment_for_month returns the bill' do
  it 'returns the bill' do
    expect(bills).to include(bill)
  end
end
