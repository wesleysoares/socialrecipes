require 'rails_helper'

feature 'User create a new recipe' do
  scenario 'successfuly' do
    visit new_recipe_path

    fill_in 'Nome da receita', with: 'Bolo de chocolate'
    fill_in 'Cozinha', with: 'Profissional'
    fill_in 'Tipo de comida', with: 'Caseira'
    fill_in 'Preferência de comida', with: 'Todas'
    fill_in 'Quantas pessoas serve', with: '5'
    fill_in 'Tempo de preparo', with: '60'
    choose('Médio')
    fill_in 'Ingredientes', with: '1 kg de farnha de trigo e fermento.'
    fill_in 'Passo a passo', with: 'Lorem ipsum dolor sit amet, consectetur
                                    adipisicing elit, sed do eiusmod tempor
                                    incididunt ut labore et dolore magna
                                    aliqua.'
    attach_file('Selecione uma foto:', 'spec/image/bolo.jpg')

    click_on 'Salvar'

    expect(page).to have_content('Bolo de chocolate')
    expect(page).to have_content('Profissional')
    expect(page).to have_content('Caseira')
    expect(page).to have_content('Todas')
    expect(page).to have_content('5')
    expect(page).to have_content('60')
    expect(page).to have_content('Médio')
    expect(page).to have_content('1 kg de farnha de trigo e fermento.')
    expect(page).to have_content('Lorem ipsum dolor sit amet, consectetur
                                  adipisicing elit, sed do eiusmod tempor
                                  incididunt ut labore et dolore magna
                                  aliqua.')
    expect(page).to have_xpath("//img[contains(@src,'bolo.jpg')]")
  end

  scenario 'unsuccessfuly' do
    visit new_recipe_path

    click_on 'Salvar'

    expect(page).to have_content('Esse campo é obrigatório', count: 6)
  end
end
