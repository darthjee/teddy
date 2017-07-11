require 'spec_helper'

describe Serializers::Payment do
  let(:payment) { build(:payment) }
  let(:bill) { payment.bill }
  let(:subject) { described_class.new(payment) }

  describe '#as_json' do
    let(:expected) do
      hash_including(
        bill_id: bill.id,
        due_date: instance_of(Date),
        id: nil,
        paid: nil,
        bill: hash_including(
          day: instance_of(Integer)
        )
      )
    end

    it 'returns the serialized payment' do
      expect(subject.as_json).to match(expected)
    end
  end
end

