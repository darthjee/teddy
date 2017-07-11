require 'spec_helper'

describe Serializers::Calendar do
  let(:subject) { described_class.new(calendar) }
  let(:month) { 3 }
  let(:year) { 2017 }
  let(:user) { users(:default) }
  let(:calendar) { Calendar.new(year, month, user) }
  let(:bill) { bills(:active) }

  describe '#as_json' do
    let(:expected_payment) do
      hash_including(
        bill_id: bill.id,
        due_date: instance_of(Date),
        paid: nil,
        bill: hash_including(
          day: instance_of(Integer)
        )
      )
    end
    let(:expected) do
      hash_including(
        first_date: instance_of(Date),
        last_date: instance_of(Date),
        payments: [expected_payment]
      )
    end

    it 'returns the serialized payment' do
      expect(subject.as_json(include: 'payments.bill')).to match(expected)
    end
  end
end

