require 'rails_helper'

feature 'Visitor send proposal' do
  scenario 'sucessfully' do
    cooker = create(:user, name: 'Zezinho', email: 'test@test.com')
    user = create(:user, name: 'Luisinho', email: 'user@test.com',
                         account_type: 1)
    coxinha = create(:product, name: 'Coxinha', user: cooker, price: 20)
    empada = create(:product, name: 'Empada', user: cooker, price: 10)
    login_as(user, scope: :user)

    visit profile_path(cooker.id)
    fill_in 'Coxinha', with: 10
    fill_in 'Empada', with: 1

    fill_in 'proposal_delivery_date_time', with: '20/12/2017 19:00'
    fill_in 'Observações', with: 'Enviar embalado'
    click_on 'Enviar'

    within('main') do
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
  scenario 'and fills nothing' do
    cooker = create(:user, name: 'Zezinho', email: 'test@test.com')
    user = create(:user, name: 'Luisinho', email: 'user@test.com')
    login_as(user, scope: :user)
    create(:product, name: 'Coxinha', user: cooker, price: 20)
    create(:product, name: 'Empada', user: cooker, price: 10)

    visit profile_path(cooker.id)
    click_on 'Enviar'

    expect(page).to have_content 'Data e hora de entrega é obrigatório(a)'

    expect(current_path).to match profiles_path(cooker)
  end
  scenario 'set current address in proposal' do
    cook = create(:user, name: 'Zezinho', email: 'test@test.com')
    user = create(:user, name: 'Luisinho', email: 'user@test.com',
                         account_type: 1, address: 'Rua Monte Azul',
                         address_number: 222, address_detail: 'apto 65',
                         postal_code: '03366-000', city_state: 'São Paulo - SP',
                         neighborhood: 'Mooca')
    create(:product, name: 'Coxinha', user: cook, price: 20)
    create(:product, name: 'Empada', user: cook, price: 10)
    login_as(user, scope: :user)

    visit profile_path(cook.id)
    check 'Entregar no meu endereço'

    addres_line = "#{user.address}, #{user.address_number}"
    address_complement = "#{user.address_detail} - #{user.neighborhood}"
    address_macro = "CEP: #{user.postal_code} - #{user.city_state}"

    fill_in 'proposal_delivery_date_time', with: '20/12/2017 19:00'
    fill_in 'Observações', with: 'Enviar embalado'
    click_on 'Enviar'

    within('main') do
      expect(page).to have_content 'Entregar no endereço:'
      expect(page).to have_css('p', text: addres_line)
      expect(page).to have_css('p', text: address_complement)
      expect(page).to have_css('p', text: address_macro)
    end
  end
  scenario 'add a new address to proposal' do
      cook = create(:user, name: 'Zezinho', email: 'test@test.com')
      user = create(:user, name: 'Luisinho', email: 'user@test.com',
                           account_type: 1, address: 'Rua Monte Azul',
                           address_number: 222, address_detail: 'apto 65',
                           postal_code: '03366-000', city_state: 'São Paulo - SP',
                           neighborhood: 'Mooca')
      create(:product, name: 'Coxinha', user: cook, price: 20)
      create(:product, name: 'Empada', user: cook, price: 10)
      login_as(user, scope: :user)

      visit profile_path(cook.id)
      uncheck 'Entregar no meu endereço'

      fill_in 'Endereço', with: 'Rua das Maria Conceição'
      fill_in 'Número', with: '15'
      fill_in 'Complemento', with: 'Apto 78'
      fill_in 'CEP', with: '03463-000'
      fill_in 'Bairro', with: 'Perus'
      fill_in 'Cidade - Estado', with: 'São Paulo - SP'

      fill_in 'proposal_delivery_date_time', with: '20/12/2017 19:00'
      click_on 'Enviar'

      within('main') do
        expect(page).to have_content 'Entregar no endereço:'
        expect(page).to have_css('p', text: 'Rua das Maria Conceição, 15')
        expect(page).to have_css('p', text: 'Apto 78 - Perus')
        expect(page).to have_css('p', text: 'CEP: 03463-000 - São Paulo - SP')
      end
    end
end
