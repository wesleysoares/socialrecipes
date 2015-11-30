require 'rails_helper'

feature 'Admin create new food preference' do
  scenario 'successfully' do
    visit new_food_preference_path

    fill_in 'Descrição:', with: 'Vegetariana'

    click_on 'Salvar'

    expect(page).to have_content('Vegetariana')
  end

  scenario 'unsuccessfully' do
    visit new_food_preference_path

    click_on 'Salvar'

    expect(page).to have_content('Esse campo é obrigatório!')
  end
end
