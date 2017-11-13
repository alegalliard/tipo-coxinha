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
  scenario 'and has no proposals' do
    cook = create(:user, name: 'Zezinho')
    login_as(cook, scope: :user)

    visit root_path
    click_on 'Minhas Propostas'

    expect(page).to have_content 'Você ainda não possui nenhuma proposta'
  end
  scenario 'and see proposal details' do
    cook = create(:user, name: 'Zezinho')
    login_as(cook, scope: :user)
    proposal = create(:proposal,
                      delivery_date_time: '16/11/2017 09:00',
                      cooker: cook)
    create(:proposal, delivery_date_time: '16/11/2017 09:00',
                      cooker: cook)

    visit root_path
    click_on 'Minhas Propostas'
    within("tr#proposal-#{proposal.id}") do
      click_on 'Detalhes'
    end

    expect(page).to have_content proposal.delivery_date_time
    expect(page).to have_content proposal.user.name
    expect(page).to have_content 'R$ 50,00'
    expect(page).to have_content proposal.observations
  end
  scenario 'and view send proposals as user' do
    cook = create(:user, name: 'Zezinho')
    user = create(:user, name: 'Luisinho', account_type: 1)
    login_as(user, scope: :user)
    proposal = create(:proposal,
                      delivery_date_time: '16/11/2017 09:00',
                      user: user)
    create(:proposal, delivery_date_time: '16/11/2017 09:00',
                      cooker: cook)

    visit root_path
    click_on 'Minhas Propostas'
    within("tr#proposal-#{proposal.id}") do
      click_on 'Detalhes'
    end

    expect(page).to have_content proposal.delivery_date_time
    expect(page).to have_content proposal.user.name
    expect(page).to have_content 'R$ 50,00'
    expect(page).to have_content proposal.observations
  end
end
