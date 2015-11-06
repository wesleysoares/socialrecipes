require 'rails_helper'

feature 'User create new type food' do
  scenario 'successfully' do
    visit new_typefood_path

    fill_in 'Descrição:', with: 'Sobremesa'

    click_on 'Salvar'

    expect(page).to have_content('Sobremesa')
  end
  scenario 'unsuccessfully' do
    visit new_typefood_path

    click_on 'Salvar'

    expect(page).to have_content('Esse campo é obrigatório')
  end
end
