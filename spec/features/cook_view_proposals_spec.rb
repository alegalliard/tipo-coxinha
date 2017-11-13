require 'rails_helper'

feature 'View list of proposals' do
  scenario 'and has proposals' do
    cook = create(:user, name: 'Zezinho')
    login_as(cook, scope: :user)
    proposal = create(:proposal,
                      delivery_date_time: '16/11/2017 09:00',
                      cooker: cook)
    other_user = create(:user, name: 'Usuário', email: 'test@test.com')
    other_proposal = create(:proposal,
                            delivery_date_time: '16/11/2017 10:00',
                            user: other_user)

    visit root_path
    click_on 'Minhas Propostas'

    expect(current_path).to match proposals_path
    within("tr#proposal-#{proposal.id}") do
      expect(page).to have_content '16/11/2017 09:00'
      expect(page).to have_content proposal.user.name
      expect(page).to have_content 'R$ 50,00'
    end
    expect(page).not_to have_content '16/11/2017 10:00'
    expect(page).not_to have_content other_proposal.user.name
  end
end
