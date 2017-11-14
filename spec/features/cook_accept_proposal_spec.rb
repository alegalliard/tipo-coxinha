require 'rails_helper'

feature 'Cook accept proposal' do
  scenario 'successfully' do
    cook = create(:user, name: 'Zezinho', email: 'cook@tipocoxinha.com',
                         password: '12345678')
    proposal = create(:proposal,
                      delivery_date_time: '16/11/2017 09:00',
                      cooker: cook)

    other_proposal = create(:proposal,
                            delivery_date_time: '16/11/2017 09:00',
                            cooker: cook)

    visit root_path
    click_on 'Login'
    fill_in 'Email', with: cook.email
    fill_in 'Senha', with: '12345678'
    click_on 'Log in'
    click_on 'Minhas Propostas'
    within("tr#proposal-#{proposal.id}") do
      click_on 'Aceitar Proposta'
    end

    within("tr#proposal-#{proposal.id}") do
      expect(page).to have_content 'Proposta Aceita'
    end

    within("tr#proposal-#{other_proposal.id}") do
      expect(page).not_to have_content 'Proposta Aceita'
    end
  end
  scenario 'and already has accepted proposals' do
    cook = create(:user, name: 'Zezinho', email: 'cook@tipocoxinha.com',
                         password: '12345678')
    proposal = create(:proposal,
                      delivery_date_time: '16/11/2017 09:00',
                      cooker: cook, status: 1)
    other_proposal = create(:proposal,
                            delivery_date_time: '16/11/2017 09:00',
                            cooker: cook)

    visit root_path
    click_on 'Login'
    fill_in 'Email', with: cook.email
    fill_in 'Senha', with: '12345678'
    click_on 'Log in'
    click_on 'Minhas Propostas'

    within("tr#proposal-#{proposal.id}") do
      expect(page).to have_content 'Proposta Aceita'
    end
    within("tr#proposal-#{other_proposal.id}") do
      expect(page).not_to have_content 'Proposta Aceita'
    end
  end
end
