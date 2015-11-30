require 'rails_helper'

feature 'User select recipe for type, preference or kitchen' do
  scenario 'select type food' do
    recipe = create(:recipe)

    visit root_path

    click_on recipe.food_preference.name

    expect(page).to have_content recipe.name_recipe
    expect(page).to have_content recipe.amount_people
    expect(page).to have_content recipe.preparation_time
    expect(page).to have_content recipe.difficulty
    expect(page).to have_content recipe.ingredients
    expect(page).to have_content recipe.preparation
  end
end
