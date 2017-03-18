require 'spec_helper'

describe Bill do
  describe 'scopes' do
    describe 'default' do
      it 'has a default scope' do
        expect(described_class.count).not_to be(described_class.unscoped.count)
      end

      it 'returns only active' do
        expect(described_class.distinct.pluck(:active)).to eq([true])
      end
    end

    describe '.for_month' do
      before do
        Timecop.freeze(2017,03,10)
      end
      let(:start_date) { Date.new(2017,03,01) }
      let(:end_date) { Date.new(2017,03,31) }
      let(:first_start_date) do
        described_class.for_month(Date.today).order(:start_date).distinct.pluck(:start_date).first
      end
      let(:last_end_date) do
        described_class.for_month(Date.today).order(:end_date).distinct.pluck(:end_date).last
      end

      it 'returns only the bills for this month' do
        expect(first_start_date).to be >= start_date
        expect(last_end_date).to be <= end_date
      end
    end
  end
end
