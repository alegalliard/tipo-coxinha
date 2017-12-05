require 'rails_helper'

feature 'cook rejects proposal' do
  scenario 'successfully' do
    cook = create(:user, name: 'Tia Cleuziane', email: 'cook@tipocoxinha.com')
    proposal = create(:proposal,
                      delivery_date_time: '16/11/2017 09:00',
                      cooker: cook)

    visit root_path
    click_on 'Login'
    fill_in 'Email', with: cook.email
    fill_in  'Senha', with: cook.password
    click_on 'Log in'
    click_on 'Minhas Propostas'
    within("tr#proposal-#{proposal.id}") do
      click_on 'Rejeitar Proposta'
    end

    expect(page).to have_content 'Proposta Rejeitada'
  end
end
