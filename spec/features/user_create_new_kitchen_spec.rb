require 'rails_helper'

feature 'User create new kitchen' do
  scenario 'successfully' do
    visit new_kitchen_path

    fill_in 'Descrição', with: 'Italiana'

    click_on 'Salvar'

    expect(page).to have_content 'Italiana'
  end

  scenario 'unsuccessufuly' do
    visit new_kitchen_path

    click_on 'Salvar'

    expect(page).to have_content('Esse campo é obrigatório!')
  end
end
