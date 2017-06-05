require 'spec_helper'

describe Payment do
  describe 'validations' do
    let(:subject) { build :payment }

    it { expect(subject).to validate_presence_of(:bill) }
    it { expect(subject).to validate_presence_of(:due_date) }
  end

  describe 'scopes' do
    let(:bill) { bills(:active) }
    let(:payments) { bill.payments }

    describe 'period' do
      let(:target_date) { Date.today + 1.day }
      before do
        Timecop.freeze(2016,03,10) do
          bill.create_payment
        end
        bill.create_payment(target_date)
      end

      context 'when requesting the target month' do
        it do
          expect(payments.period(target_date)).not_to be_empty
        end

        it do
          expect(payments.period(target_date).count).to eq(1)
        end
      end

      context 'when not passing the month' do
      end
    end
  end
end
