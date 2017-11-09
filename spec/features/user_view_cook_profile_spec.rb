require "rails_helper"

feature "User view cook profile" do
  scenario 'successfully' do
    user = create(:user, name: 'Zezinho')
    coxinha = create(:product, name: 'Coxinha', user: user, price: 20)
    empada = create(:product, name: 'Empada', user: user, price: 10)

    visit profile_path(user.id)

    within('main') do
      expect(page).to have_css('h1', text: user.name)
      expect(page).to have_css('img.avatar')

      within("div#product-#{coxinha.id}") do
        expect(page).to have_content coxinha.name
        expect(page).to have_content 'R$ 20,00'
      end

      within("div#product-#{empada.id}") do
        expect(page).to have_content empada.name
        expect(page).to have_content 'R$ 10,00'
      end

    end
  end

  scenario 'and cook has no products' do
      user = create(:user, name: 'Zezinho')

      visit profile_path(user.id)

      within('main') do
        expect(page).to have_css('h1', text: user.name)
        expect(page).to have_css('img.avatar')
        expect(page).to have_css('h3', text: 'Desculpe, este cozinheiro ainda'\
                                             ' não cadastrou seus produtos =(')
      end

  end
end
