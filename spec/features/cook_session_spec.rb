require 'rails_helper'

feature 'Cook session' do
  scenario 'and login' do
    user = create(:user)

    visit root_path
    click_on 'Login'

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Log in'

    expect(page).to have_css('div.alert-success', text: 'Login efetuado com sucesso.')
  end
  scenario 'and logout' do
    user = create(:user)
    login_as(user, scope: :user)

    visit root_path

    click_on 'Sair'

    expect(current_path).to eq(root_path)
    expect(page).to have_css('div.alert-success', text: 'Logout efetuado com sucesso.')
  end
end
