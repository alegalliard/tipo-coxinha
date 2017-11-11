require 'rails_helper'

feature 'user sign up' do
  scenario 'successfully' do
    visit root_path
    click_on 'Inscrever-se'

    fill_in 'Nome', with: 'Joana Costa'
    fill_in 'Email', with: 'joaninha@email.com'
    fill_in 'Senha', with: '12345678'
    fill_in 'Confirme sua senha', with: '12345678'
    fill_in 'Endereço', with: 'Rua das Flores'
    fill_in 'Número', with: '15'
    fill_in 'Complemento', with: 'Apto 2'
    fill_in 'CEP', with: '03333-000'
    fill_in 'Bairro', with: 'Perus'
    fill_in 'Cidade - Estado', with: 'São Paulo - SP'
    fill_in 'Telefone', with: '1199834-5678'
    attach_file('Avatar', "#{Rails.root}/spec/support/fixtures/image.jpg")
    select 'Usuário(a)', from: 'Eu sou'
    click_on 'Criar Conta'

    msg = 'Bem vindo! Você realizou seu registro com sucesso.'
    expect(page).to have_css('div', text: msg)
    expect(page).to have_css('h1', text: 'Joana Costa')
    expect(page).to have_css('dd', text: 'joaninha@email.com')
    expect(page).to have_css('dd', text: 'Rua das Flores, 15')
    expect(page).to have_css('dd', text: 'Apto 2')
    expect(page).to have_css('dd', text: '03333-000')
    expect(page).to have_css('dd', text: 'Perus')
    expect(page).to have_css('dd', text: 'São Paulo - SP')
    expect(page).to have_css('dd', text: '1199834-5678')
    expect(page).to have_css('dd', text: 'Usuário(a)')

    expect(page).to have_xpath("//img[contains(@src,'image.jpg')]")
  end
end
