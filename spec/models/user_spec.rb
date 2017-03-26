require 'spec_helper'

describe User do
  let(:subject) { users(:default) }

  describe 'validations' do
    it { expect(subject).to validate_presence_of(:email) }
  end

  describe '#bills' do
    it { expect(subject).to respond_to(:bills) }
    it { expect(subject.bills).not_to be_empty }
  end
end
