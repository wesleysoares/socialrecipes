require 'rails_helper'

feature 'User authenticates on the site' do
  scenario 'successfully' do

    kitchen = create(:kitchen)
    type_food = create(:type_food)
    food_preference = create(:food_preference)
    user = create(:user)

    sign_in :user, @user

  end
end
