require 'rails_helper'

feature 'User keep his recipes' do
  scenario 'and see' do
    user1 = create(:user)
    user2 = create(:user, email: 'teste@email.com')
    recipe1 = create(:recipe, user: user1)
    recipe2 = create(:recipe, user: user2)

    visit new_user_session_path

    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password

    click_on 'Log in'

    click_on 'Minhas receitas'

    expect(page).to have_content recipe1.name_recipe
    expect(page).to have_content recipe1.kitchen.name
    expect(page).to have_content recipe1.type_food.name
    expect(page).to have_content recipe1.food_preference.name
    expect(page).not_to have_content recipe2.name_recipe
  end

  scenario 'and not recipes' do
    user = create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_on 'Log in'

    click_on 'Minhas receitas'

    expect(page).to have_content 'Sem receitas cadastradas :('
  end

  scenario 'and see details of recipe' do
    user = create(:user)
    recipe = create(:recipe, user: user, image: File
                    .open(Rails.root.join('spec', 'image', 'bolo.jpg')))

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_on 'Log in'

    click_on 'Minhas receitas'
    click_on 'Bolo de chocolate'

    expect(page).to have_content('Bolo de chocolate')
    expect(page).to have_content recipe.kitchen.name
    expect(page).to have_content recipe.type_food.name
    expect(page).to have_content recipe.food_preference.name
    expect(page).to have_content('5')
    expect(page).to have_content('60')
    expect(page).to have_content('Médio')
    expect(page).to have_content('Farinha de trigo e fermento')
    expect(page).to have_content('Junte tudo e pronto!')
    expect(page).to have_xpath("//img[contains(@src,'bolo.jpg')]")
  end
end
