require 'spec_helper'

describe CalendarController do
  describe 'GET index' do
    let(:month) { 3 }
    let(:year) { 2017 }
    let(:parameters) { { year: year, month: month, format: :json } }
    let(:response_json) { JSON.parse(response.body).underscore_keys.deep_symbolize_keys }
    let(:previews_month) { Date.new(year, month - 1, 1) }
    let(:current_month) { Date.new(year, month, 1) }
    let(:bill) { bills(:active) }
    let(:bill_id) { bill.id }

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

        it_behaves_like 'a route that creates and returns all the payments for that month'

        context 'when there is already payment for this month' do
          before do
            Bill.all.each { |b| b.create_payment(current_month) }
          end

          it 'returns the payments for this month' do
            get :index, params: parameters

            expect(payments_json).to match([
              hash_including(due_date:1489104000000, bill_id: bill_id, paid: nil)
            ])
          end

          it 'should not create new payments' do
            expect do
              get :index, params: parameters
            end.not_to change(Payment, :count)
          end
        end

        context 'when there is a payment for the previews month' do
          before do
            Bill.all.each { |b| b.create_payment(previews_month) }
          end

          it_behaves_like 'a route that creates and returns all the payments for that month'

          it 'does not return the payment for previows month' do
            get :index, params: parameters
            expect(payments_json).not_to include(
              hash_including(due_date: 1486684800000, bill_id: bill_id, paid: nil)
            )
          end
        end

        context 'when the bill is not active' do
          let(:bill) { bills(:inactive) }

          it 'does not return payment for the bill' do
            get :index, params: parameters

            expect(payments_json).not_to match([
              hash_including(due_date:1489104000000, bill_id: bill_id, paid: nil)
            ])
          end

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
