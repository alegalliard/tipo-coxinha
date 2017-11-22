require 'rails_helper'

feature 'user edits his own profile' do
  scenario 'change basic information succefully' do
    msg = 'A sua conta foi atualizada com sucesso.'
    user = create(:user, name: 'Tia Cleuza dos Santos',
                         email: 'tia@cleuza.com',
                         password: 'tiaCleuza2017',
                         address_detail: '')
    visit root_path

    click_on 'Login'

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Log in'
    expect(page)
      .to have_css('div.alert-success', text: 'Login efetuado com sucesso.')

    click_on 'Editar dados'

    fill_in 'Nome', with: 'Cleuza Maria Braga'
    fill_in 'Email', with: 'tia@cleuza.com.br'
    fill_in 'Senha atual', with: 'tiaCleuza2017'
    fill_in 'Complemento', with: 'Apto 51'

    click_on 'Atualizar'

    expect(page).to have_css('.alert-success', text: msg)
    find_field('Nome') { |el| el['value'] == 'Cleuza Maria Braga' }
    find_field('Email') { |el| el['value'] == 'tia@cleuza.com.br' }
    fint_field('Complemento') { |el| el['value'] == 'Apto 51' }
  end
end
