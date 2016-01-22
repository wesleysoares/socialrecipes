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
  scenario 'and edit' do

    user = create(:user)
    recipe = create(:recipe, user: user, image: File
                    .open(Rails.root.join('spec', 'image', 'bolo.jpg')))
    kitchen1 = create(:kitchen, name: 'Espanhola')
    type_food1 = create(:type_food, name: 'Italiana')
    food_preference1 = create(:food_preference, name: 'Quente')

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_on 'Log in'
    click_on 'Minhas receitas'

    visit edit_recipe_path(recipe.id)

    fill_in 'Nome da receita', with: 'Bolo de laranja'
    select kitchen1.name, from: 'Cozinha'
    select type_food1.name, from: 'Tipo de comida'
    select food_preference1.name, from: 'Preferência de comida:'
    fill_in 'Quantas pessoas serve', with: '10'
    fill_in 'Tempo de preparo', with: '35'
    choose('Difícil')
    fill_in 'Ingredientes', with: '1 kg de farnha de trigo e fermento.'
    fill_in 'Passo a passo', with: 'Lorem ipsum dolor sit amet, consectetur
                                    adipisicing elit, sed do eiusmod tempor
                                    incididunt ut labore et dolore magna
                                    aliqua.'
    attach_file('Selecione uma foto:', 'spec/image/laranja.jpg')

    click_on 'Salvar'

    expect(page).to have_content('Bolo de laranja')
    expect(page).to have_content kitchen1.name
    expect(page).to have_content type_food1.name
    expect(page).to have_content food_preference1.name
    expect(page).to have_content('10')
    expect(page).to have_content('35')
    expect(page).to have_content('Difícil')
    expect(page).to have_content('1 kg de farnha de trigo e fermento.')
    expect(page).to have_content('Lorem ipsum dolor sit amet, consectetur
                                    adipisicing elit, sed do eiusmod tempor
                                    incididunt ut labore et dolore magna
                                    aliqua.')
    expect(page).to have_xpath("//img[contains(@src,'laranja.jpg')]")
  end
end
