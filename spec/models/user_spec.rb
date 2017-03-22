require 'spec_helper'

describe User do
  let(:subject) { users(:default) }

  describe '#bills' do
    it { expect(subject).to respond_to(:bills) }
    it { expect(subject.bills).not_to be_empty }
  end
end
