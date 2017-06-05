require 'spec_helper'

describe CalendarController do
  describe 'GET index' do
    let(:parameters) { { year: 2017, month: 3, format: :json } }
    let(:response_json) { JSON.parse(response.body).deep_symbolize_keys }

    context 'when requesting for a month that has bills' do
      it 'returns the end and start of month' do
        get :index, params: parameters

        expect(response_json).to include(
          firstDate: 1488326400000,
          lastDate: 1490918400000
        )
      end
    end
  end
end
