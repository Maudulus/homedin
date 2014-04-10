require 'spec_helper'

feature 'user adds a rating', %q{
  as a user
  i want to rate a house
  so that I can see how much I liked the house at a later point
  } do

  scenario 'user adds rating on the /houses/new page' do
    house = FactoryGirl.build(:house)
    visit new_house_path
    house_new_helper(house)
    fill_in 'Rating', with: 4
  end

  scenario 'user adds rating on the houses/edit page' do

  end

end
