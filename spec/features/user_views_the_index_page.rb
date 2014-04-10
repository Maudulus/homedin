require 'spec_helper'

feature 'user views his/her houses', %q{
  as a user
  i want to view houses I have added on the houses index page
  so that I can compare the various houses in one easily viewable place
  } do

  scenario 'user finds a previously added house on houses index page' do
    houses = FactoryGirl.create_list(:house, 3)
    visit new_house_path
    houses.each do |house|
      expect(page).to have_content(house.price)
      expect(page).to have_content(house.town)
      expect(page).to have_content(house.description)
      expect(page).to have_content(house.bedrooms)
      expect(page).to have_content(house.bathrooms)
      expect(page).to have_content(house.url)
    end

    # house = FactoryGirl.build(:house)
    # visit root_path
    # click_on 'New'
    # house_new_helper(house)
    # click_on 'Add House'


    # expect(page).to have_content(house.price)
    # expect(page).to have_content(house.town)
    # expect(page).to have_content(house.description)
    # expect(page).to have_content(house.bedrooms)
    # expect(page).to have_content(house.bathrooms)
    # expect(page).to have_content(house.url)
  end
end
