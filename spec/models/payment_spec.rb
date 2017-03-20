require 'spec_helper'

describe Payment do
  describe 'validations' do
    let(:bill) { bills(:active) }
    let(:attributes) do
      {
        due_date: Date.today,
        bill: bill
      }
    end
    let(:subject) { described_class.new(attributes) }

    it { expect(subject).to validate_presence_of(:bill) }
    it { expect(subject).to validate_presence_of(:due_date) }
  end
end
