require 'spec_helper'

describe Payment do
  describe 'validations' do
    let(:subject) { build :payment }

    it { expect(subject).to validate_presence_of(:bill) }
    it { expect(subject).to validate_presence_of(:due_date) }
  end
end
