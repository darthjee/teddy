shared_context 'user is logged in' do
  let(:logged_user) { User.first }

  before do
    allow(controller).to receive(:logged_user) { logged_user }
  end
end
