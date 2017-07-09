require 'spec_helper'

describe Serializers::Payment do
  let(:payment) { build(:payment) }
  let(:bill) { payment.bill }
  let(:subject) { described_class.new(payment) }

  describe '#as_json' do
    let(:expected) do
      {
        bill_id: bill.id,
        due_date: instance_of(Date),
        id: nil,
        paid: nil
      }.stringify_keys
    end

    it do
      expect(subject.as_json).to match(
        hash_including(expected)
      )
    end
  end
end

