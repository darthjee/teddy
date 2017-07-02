require 'spec_helper'

describe Bill do
  describe 'scopes' do
    describe 'active' do
      it 'scope exist' do
        expect(described_class.active.count).not_to be(described_class.count)
      end

      it 'returns only active' do
        expect(described_class.active.distinct.pluck(:active)).to eq([true])
      end
    end

    describe '.for_month' do
      before do
        Timecop.freeze(2017,03,10)
      end
      let(:start_date) { Date.new(2017,03,01) }
      let(:end_date) { Date.new(2017,03,31) }
      let(:bills_of_month) { described_class.active.for_month(Date.today) }
      let(:first_start_date) do
        bills_of_month.order(:start_date).distinct.pluck(:start_date).first
      end
      let(:last_end_date) do
        bills_of_month.order(:end_date).distinct.pluck(:end_date).last
      end
      let(:active) { bills(:active) }
      let(:expired) { bills(:expired) }
      let(:not_started) { bills(:not_started) }

      it 'returns only the bills for this month' do
        expect(first_start_date).to be >= start_date
        expect(last_end_date).to be <= end_date
      end

      it 'returns the bill for the current month' do
        expect(bills_of_month).to include(active)
      end

      it 'does not return the bill for the previous month' do
        expect(bills_of_month).not_to include(expired)
      end

      it 'does not return the bill for the previous month' do
        expect(bills_of_month).not_to include(not_started)
      end

      context 'when month range has a bill with no start_date (previeous month)' do
        before do
          Timecop.freeze(2017,02,10)
        end
        let(:end_date) { Date.new(2017,02,28) }

        it 'is accepted as any date' do
          expect(first_start_date).to be_nil
          expect(last_end_date).to be <= end_date
        end

        it 'does not return the bill for the current month' do
          expect(bills_of_month).not_to include(active)
        end

        it 'returns the bill for the previous month' do
          expect(bills_of_month).to include(expired)
        end

        it 'does not return the bill for the previous month' do
          expect(bills_of_month).not_to include(not_started)
        end
      end

      context 'when end_date has not been defined' do
        before do
          Timecop.freeze(2017,04,10)
        end
        let(:start_date) { Date.new(2017,04,01) }

        it 'is accepted as any date' do
          expect(first_start_date).to be >= start_date
          expect(last_end_date).to be_nil
        end

        it 'does not returns the bill for the current month' do
          expect(bills_of_month).not_to include(active)
        end

        it 'does not return the bill for the previous month' do
          expect(bills_of_month).not_to include(expired)
        end

        it 'returns the bill for the previous month' do
          expect(bills_of_month).to include(not_started)
        end
      end
    end
  end

  describe 'validations' do
    let(:user) { users(:default) }
    let(:subject) { build :bill, user: user }

    it { expect(subject).not_to validate_presence_of(:active) }
    it { expect(subject).not_to validate_presence_of(:start_date) }
    it { expect(subject).not_to validate_presence_of(:end_date) }
    it { expect(subject).to validate_presence_of(:day) }
    it { expect(subject).to validate_presence_of(:user) }
  end

  describe '#create_payment' do
    before do
      Timecop.freeze(2017,03,10)
    end
    let(:subject) { bills(:active) }
    let(:month_date) { Date.today }

    it do
      expect do
        subject.create_payment(month_date)
      end.to change(Payment, :count)
    end

    it do
      expect(subject.create_payment(month_date)).to be_a(Payment)
    end
  end

  describe '#build_payment' do
    before do
      Timecop.freeze(2017,03,10)
    end
    let(:subject) { bills(:active) }
    let(:month_date) { Date.today }
    let(:beginning_of_month) { month_date.beginning_of_month }
    let(:end_of_month) { month_date.end_of_month }
    let(:built_payment) { subject.build_payment(month_date + 1.month) }

    it do
      expect do
        subject.build_payment(month_date)
      end.not_to change(Payment, :count)
    end

    it do
      expect(subject.build_payment(month_date)).to be_a(Payment)
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
        expect(subject.build_payment.due_date).to be_between(beginning_of_month, end_of_month)
      end
    end
  end
end
