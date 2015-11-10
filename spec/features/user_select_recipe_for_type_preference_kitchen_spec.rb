require 'rails_helper'

feature 'User select recipe for type, preference or kitchen' do
  scenario 'select type food' do

    recipe = create(:recipe)

    visit root_path

    click_on 'Brasileira'

    expect(page).to have_content('Bolo de chocolate')

  end
end
