require 'spec_helper'

describe Tsung::User do
  shared_context 'an object that has a secure random code start up' do |*methods|
    methods.each do |method|
      describe "##{method}" do
        subject { build(:user, method => nil) }

        context "when the user does not have a #{method}" do
          it do
            expect { subject.public_send("start_#{method}") }.to change(subject, method)
          end
        end

        context "when the user has a #{method}" do
          subject { build(:user, method => 'aaaa') }

          it do
            expect { subject.public_send("start_#{method}") }.not_to change(subject, method)
          end
        end
      end
    end
  end

  it_behaves_like 'an object that has a secure random code start up', :code, :authentication_token

  describe '.create' do
    subject { build(:user, code: nil, authentication_token: nil) }

    it do
      expect { subject.save }.to change(subject, :code)
    end

    it do
      expect { subject.save }.to change(subject, :authentication_token)
    end
  end

  describe '.login' do
    let(:email) { 'user@server.com' }
    let!(:user) { create(:user, email: email, password: password) }

    context 'when user does not possess passowrd' do
      let(:password) {}

      it 'does not retrieve user' do
        expect(User.login(email, password)).to be_nil
      end
    end

    context 'when user does possess passowrd' do
      let(:password) { '12345678' }

      it 'does not retrieve user' do
        expect(User.login(email, password)).to eq(user)
      end
    end
  end
end
