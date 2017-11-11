require 'rails_helper'

feature 'Visitor send proposal' do
  scenario 'sucessfully' do
    cooker = create(:user, name: 'Zezinho', email: 'test@test.com')
    user = create(:user, name: 'Luisinho', email: 'user@test.com')
    login_as(user, scope: :user)
    coxinha = create(:product, name: 'Coxinha', user: cooker, price: 20)
    empada = create(:product, name: 'Empada', user: cooker, price: 10)

    visit profile_path(cooker.id)
    save_page
    fill_in 'Coxinha', with: 10
    fill_in 'Empada', with: 1

    fill_in 'proposal_delivery_date_time', with: '20/12/2017 19:00'    
    fill_in 'Observações', with: 'Enviar embalado'
    click_on 'Enviar'

    within('main') do
      save_page
      expect(page).to have_content '20/12/2017 19:00'
      expect(page).to have_css('h3', text: user.name)
      expect(page).to have_css('img.avatar')
      expect(page).to have_content user.phone
      expect(page).to have_content user.email
      expect(page).to have_css('h3', text: 'Produtos')
      within("tr#product-#{coxinha.id}") do
        expect(page).to have_content coxinha.name
        expect(page).to have_content 'R$ 20,00'
      end
      within("tr#product-#{empada.id}") do
        expect(page).to have_content empada.name
        expect(page).to have_content 'R$ 10,00'
      end
      expect(page).to have_content 'R$ 210,00'
      expect(page).to have_content "#{user.neighborhood} - #{user.city_state}"
      expect(page).to have_content 'Enviar embalado'
    end
  end
end
