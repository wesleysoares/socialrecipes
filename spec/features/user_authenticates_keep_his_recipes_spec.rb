require 'rails_helper'

feature 'User keep his recipes' do
  scenario 'and see' do

    user = create(:user)
    recipe = create(:recipe, user: user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_on 'Log in'

    click_on 'Minhas receitas'

    expect(page).to have_content recipe.name_recipe
  end
end
