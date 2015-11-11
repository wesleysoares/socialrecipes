require 'rails_helper'

feature 'User see last twenty recipes' do
  scenario 'successfully' do
    create(:recipe, name_recipe: 'Receita antiga')
    create_list(:recipe, 20)

    visit root_path

    expect(page).not_to have_content('Receita antiga')
    expect(page).to have_content('Bolo de chocolate 1')
    expect(page).to have_content('Bolo de chocolate 20')
    expect(page).to have_content('Vegetariana', count: 20)
    expect(page).to have_content('Brasileira', count: 20)
    expect(page).to have_content('Italiana', count: 20)
    expect(page).to have_content('Italiana', count: 20)
    expect(page).to have_content('Médio', count: 20)
  end
end
