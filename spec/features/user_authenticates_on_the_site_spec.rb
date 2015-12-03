require 'rails_helper'

feature 'User authenticates on the site' do
  scenario 'successfully' do

    visit root_path

    click_on 'Fazer Login'

    fill_in 'Nome', with: 'Wesley'
    fill_in 'Senha', with: 'abc12345678'

    click_on 'Entrar'

    expect(page).to have_content 'Minhas receitas'

  end
end
