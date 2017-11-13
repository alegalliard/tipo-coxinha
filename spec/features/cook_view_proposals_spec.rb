require 'rails_helper'

feature 'View list of proposals' do
  scenario 'and has proposals' do
    cook = create(:user, name: 'Zezinho', email: 'test@test.com')
    proposal = create(:proposal)

    visit root_path
    click_on 'Minhas Propostas'

    expect(current_path).to match proposal_path(cook)
    expect(page).to have_content proposal.delivery_date_time
    expect(page).to have_content proposal.user.name
    expect(page).to have_content proposal.total_price
  end
end
