shared_examples 'a route that returns all the payments for that month' do
  it 'returns the payments for this month' do
    get :index, params: parameters

    expect(payments_json).to match([
      hash_including(due_date:1489104000000, bill_id: 1, paid: nil)
    ])
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
