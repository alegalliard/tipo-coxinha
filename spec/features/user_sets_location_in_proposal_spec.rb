require 'rails_helper'

feature 'user sets location on proposal' do
  scenario 'with his own location' do
    cook = create(:user, neighborhood: 'Sacomã')
    user = create(:user, name: 'Júnior Lima', email:'junior@lima.com')
    category = create(:category)
    unity = create(:unity)
    product = create(:product, category: category, user: cook, unity: unity)
    login_as(user, scope: :user)

    visit root_path

    fill_in 'Busca por região', with: 'Sacomã'
    click_on 'Buscar'

    click_on 'Ver detalhes'

  end
end
