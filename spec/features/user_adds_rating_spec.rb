require 'spec_helper'

feature 'user adds a rating', %q{
  as a user
  i want to rate a house
  so that I can see how much I liked the house at a later point
  } do

  scenario 'user adds rating on the /houses/new page' do
      count = Rating.count
      user = FactoryGirl.create(:user)
      visit root_path
      click_on 'Sign in'
      form_filler(user)
      click_on 'Sign in'
      house = FactoryGirl.build(:house)
      visit new_house_path
      house_new_helper(house)
      click_on 'Add House'
      click_on 'SHOW'
      select( 5, from: 'Value')
      click_on 'Create Rating'
      click_on 'SHOW'

      expect(Rating.count).to eq(count + 1)
      within(:css, '#rating_value') {5}
  end

end
