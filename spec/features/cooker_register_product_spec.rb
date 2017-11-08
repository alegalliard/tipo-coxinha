require "rails_helper"

feature "Cooker register product" do
  scenario 'successfully' do
    create(:category, name: 'Salgado')
    create(:delivery_type, name: 'Congelado')
    create(:unity, name: 'Quilo')
    visit root_path
    click_on 'Cadastrar Produto'

    fill_in 'Nome', with: 'coxinha de frango'
    select 'Salgado', from: 'Categoria'
    select 'Congelado', from: 'Forma de Entrega'
    select 'Quilo', from: 'Unidade'
    fill_in 'Preço', with: 'R$ 10,00'
    click_on 'Cadastrar'

    expect(page).to have_content 'coxinha de frango'
    expect(page).to have_content 'Salgado'
    expect(page).to have_content 'Congelado'
    expect(page).to have_content 'Quilo'
    expect(page).to have_content 'R$ 10,00'
  end
end
