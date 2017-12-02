require 'rails_helper'

feature 'Visitor searches cook by region' do
  scenario 'and find matches' do
    cook = create(:user, name: 'Docinhos enormes da dona Magali',
                         neighborhood: 'Sacomã')

    visit root_path

    fill_in 'Busca por região', with: 'Sacomã'
    click_on 'Buscar'

    expect(page).to have_css('h1', text: 'Resultados da busca')

    expect(page).to have_xpath("//img[contains(@src,'image.jpg')]")

    expect(page).to have_css('h2', text: cook.name)
    expect(page).to have_css('p', text: cook.description)
    within "li#cook-#{cook.id}" do
      expect(page).to have_link('Ver detalhes')
    end
  end

  scenario 'and find no results' do
    visit root_path

    fill_in 'Busca por região', with: 'Sacomã'
    click_on 'Buscar'

    expect(page).to have_css('div.alert-warning',
                             text: I18n.t('general.search_no_results'))
    click_on I18n.t('general.back')

    expect(current_path).to eq(root_path)
  end

  scenario 'and search shows only cook' do
    user = create(:user, name: 'Mônica', neighborhood: 'Sacomã',
                         account_type: 1)

    visit root_path

    fill_in 'Busca por região', with: 'Sacomã'
    click_on 'Buscar'

    expect(page).to have_no_css('h2', text: user.name)
    expect(page).to have_no_css('p', text: user.description)
  end
end
