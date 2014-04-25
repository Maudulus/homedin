require 'spec_helper'

feature 'user adds a rating to a house', %q{
  as a user
  i want to rate a house
  so that I can see how much I liked the house at a later point
  } do

  scenario 'user adds rating on the /houses/new page' do
      count = Rating.count
      user = FactoryGirl.create(:user)
      visit root_path
      click_on 'Sign In'
      form_filler(user)
      click_on 'Sign in'
      house = FactoryGirl.build(:house)
      visit new_house_path
      house_new_helper(house)
      click_on 'Add House'
      click_on 'SHOW'

      choose("rating_cost_8")
      choose("rating_location_8")
      choose("rating_education_8")
      choose("rating_parking_8")
      choose("rating_condition_8")
      choose("rating_spaciousness_8")
      choose("rating_bedrooms_8")
      choose("rating_bathrooms_8")
      choose("rating_commute_8")
      choose("rating_culture_8")

      click_on 'Create Rating'
      click_on 'SHOW'
      expect(Rating.count).to eq(count + 1)
      save_and_open_page
      within(:css, '#rating_commute_8').should be_checked
  end

end
