require 'spec_helper'

describe CalendarController do
  describe 'GET index' do
    let(:parameters) { { year: 2017, month: 3, format: :json } }
    let(:response_json) { JSON.parse(response.body).underscore_keys.deep_symbolize_keys }

    context 'when requesting for a month that has bills' do
      let(:payments_json) { response_json[:payments] }

      it 'returns the end and start of month' do
        get :index, params: parameters

        expect(response_json).to include(
          first_date: 1488326400000,
          last_date: 1490918400000
        )
      end

      context 'user is logged in' do
        include_context 'user is logged in'

        it 'returns the payments for this month' do
          get :index, params: parameters

          expect(payments_json).to match([
            hash_including(due_date:1489104000000, bill_id: 1, paid: nil)
          ])
        end
      end

      context 'user without payment is logged in' do
        include_context 'user is logged in'
        let(:logged_user) { create :user }

        it 'returns an empty payment list' do
          get :index, params: parameters

          expect(payments_json).to be_empty
        end
      end
    end
  end
end
