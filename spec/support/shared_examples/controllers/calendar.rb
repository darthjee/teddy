shared_examples 'a route that returns all the payments for that month' do
  it 'returns the payments for this month' do
    get :index, params: parameters

    expect(payments_json).to include(
      hash_including(expected_payment)
    )
  end
end

shared_examples 'a route that creates and returns all the payments for that month' do
  it_behaves_like 'a route that returns all the payments for that month'

  it 'should create new payments' do
    expect do
      get :index, params: parameters
    end.to change(Payment, :count).by(1)
  end
end
