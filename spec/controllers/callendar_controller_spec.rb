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

      it 'returns the payments for this month' do
        month_date = Date.new(2017, 3, 1)
        Bill.active.for_month(month_date).each { |b| b.create_payment(month_date) }

        get :index, params: parameters

        expect(payments_json.map { |p| p.slice(:due_date, :bill_id, :paid) }).to eq([
          { due_date:1489104000000, bill_id: 1, paid: nil }
        ])
      end
    end
  end
end
