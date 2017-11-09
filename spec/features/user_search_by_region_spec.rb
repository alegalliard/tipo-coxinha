require 'rails_helper'

feature 'Visitor searches cook by region' do
  scenario 'and find matches' do
    cook = create(:user, name: 'Docinhos enormes da dona Magali')

    visit root_path

    fill_in 'Busca por região', with: 'Sacomã, São Paulo - SP'
    click_on 'Buscar'

    expect(page).to have_css('h1', text: 'Resultados da busca')

    expect(page).to have_xpath("//img[contains(@src,'image.jpg')]")

    expect(page).to have_css('h2', text: cook.name)
    expect(page).to have_css('p', text: cook.desc)
    within 'li#cook-#{cook_id}' do
      expect(page).to have_link('Ver detalhes')
    end
  end
end
