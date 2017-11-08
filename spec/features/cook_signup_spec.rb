require 'rails_helper'

feature 'Cook signup' do
  scenario 'successfully' do
    visit root_path
    click_on 'Inscrever-se'

    fill_in 'Nome', with: 'Tia Cleuza'
    fill_in 'Email', with: 'emaildatia@email.com'
    fill_in 'Senha', with: '12345678'
    fill_in 'Confirme sua senha', with: '12345678'
    fill_in 'Bairro', with: 'Sacomã'
    fill_in 'Cidade - Estado', with: 'São Paulo - SP'
    fill_in 'Telefone', with: '1191234-5678'
    select 'Cozinheiro(a)', from: 'Eu sou'
    click_on 'Criar Conta'

    expect(page).to have_css('div',
                             text: 'Bem vindo! Você realizou seu registro com sucesso.')
  end

  scenario 'validate fields' do
    visit root_path

    click_on 'Inscrever-se'

    fill_in 'Nome', with: ''
    fill_in 'Email', with: ''
    fill_in 'Senha', with: ''
    fill_in 'Confirme sua senha', with: ''
    fill_in 'Bairro', with: ''
    fill_in 'Cidade - Estado', with: ''
    fill_in 'Telefone', with: ''

    click_on 'Criar Conta'

    expect(page).to have_css('div.alert-error',
                             text: 'Nome é obrigatório(a)')
    expect(page).to have_css('div.alert-error',
                             text: 'Email é obrigatório(a)')
    expect(page).to have_css('div.alert-error',
                             text: 'Bairro é obrigatório(a)')
    expect(page).to have_css('div.alert-error',
                             text: 'Cidade - Estado é obrigatório(a)')
    expect(page).to have_css('div.alert-error',
                             text: 'Telefone é obrigatório(a)')
  end
end
