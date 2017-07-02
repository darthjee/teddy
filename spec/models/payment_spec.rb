require 'spec_helper'

describe Payment do
  describe 'validations' do
    let(:subject) { build :payment }

    it { expect(subject).to validate_presence_of(:bill) }
    it { expect(subject).to validate_presence_of(:due_date) }
  end

  describe 'scopes' do
    let(:month) { 3 }
    let(:current_month) { Date.today.month }
    let(:bill) { bills(:active) }
    let(:payments) { bill.payments }

    describe 'period' do
      let(:target_date) { Date.today + 1.day }
      before do
        Timecop.freeze(2016, month, 10) do
          bill.create_payment
        end
        bill.create_payment(target_date)
      end

      context 'when requesting the target month' do
        it do
          expect(payments.period(target_date)).not_to be_empty
        end

        context 'and there is a payment for the next month' do
          let(:ahead_of_time_payment) { payment }
          let!(:future_payment) do
            bill.create_payment(target_date + 1.month)
          end

          it do
            expect(payments.period(target_date)).not_to include(future_payment)
          end
        end
      end
    end
  end
end
