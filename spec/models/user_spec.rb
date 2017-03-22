require 'spec_helper'

describe User do
  let(:subject) { users(:default) }

  describe '#bills' do
    it { expect(subject).to respond_to(:bills) }
  end
end
