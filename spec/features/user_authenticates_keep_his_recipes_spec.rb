require 'rails_helper'

feature 'User keep his recipes' do
  scenario 'and see' do

    user1 = create(:user)
    user2 = create(:user, email: 'teste@email.com')
    recipe1 = create(:recipe, user: user1)
    recipe2 = create(:recipe, user: user1)
    recipe3 = create(:recipe, user: user2)

    visit new_user_session_path

    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password

    click_on 'Log in'

    click_on 'Minhas receitas'

    expect(page).to have_content recipe1.name_recipe
    expect(page).to have_content recipe2.name_recipe
    expect(page).not_to have_content recipe3.name_recipe
  end

  scenario 'and not recipes' do

    user = create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_on 'Log in'

    click_on 'Minhas receitas'

    expect(page).to have_content 'Sem receitas cadastradas.'
  end
end
