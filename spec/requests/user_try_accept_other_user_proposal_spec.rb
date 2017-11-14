require 'rails_helper'

RSpec.describe 'User try to accept other user proposal', type: :request do
  it 'error on root' do
    cook = create(:user, name: 'Zezinho', email: 'cook@tipocoxinha.com',
                         password: '12345678')
    proposal = create(:proposal,
                      delivery_date_time: '16/11/2017 09:00')

    sign_in cook
    post accept_proposal_path(proposal)
    follow_redirect!

    expect(response.body).to include('Ação não autorizada')
  end
end
