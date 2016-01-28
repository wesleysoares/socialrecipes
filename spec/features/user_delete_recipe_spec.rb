require 'rails_helper'

feature 'User delete recipe' do
  scenario 'successfully' do
    user = create(:user)
    recipe = create(:recipe, user: user, image: File
                    .open(Rails.root.join('spec', 'image', 'bolo.jpg')))

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_on 'Log in'

    click_on 'Minhas receitas'
    click_on 'Excluir'

    expect(page).to not_have recipe.name_recipe
  end
end
