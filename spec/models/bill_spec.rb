require 'spec_helper'

describe Bill do
  describe 'scopes' do
    describe 'default' do
      it 'has a default scope' do
        expect(described_class.count).not_to be(described_class.unscoped.count)
      end

      it 'returns only active' do
        expect(described_class.uniq.pluck(:active)).to eq([true])
      end
    end
  end
end
