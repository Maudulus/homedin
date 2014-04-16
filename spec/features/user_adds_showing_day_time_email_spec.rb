require 'spec_helper'

feature 'user adds time/date/phone', %q{
  as a user
  i want to add a house showing time, date and phone
  so that I can remember when the house has a showing and can visit the house
  } do

  scenario 'user adds day and time on the houses individual page' do
    user = FactoryGirl.create(:user)
    #user signs in
    visit root_path
    click_on 'Sign in'
    form_filler(user)
    click_on 'Sign in'
    #user adds house
    house = FactoryGirl.build(:house)
    visit new_house_path
    house_new_helper(house)
    click_on 'Add House'
    click_on 'SHOW'
    #user adds textmessage alert
    fill_in 'house_rating_1i', with: 2014
    fill_in "house_rating_2i", with: "April"
    fill_in 'house_rating_3i', with: 16
    fill_in 'house_rating_4i', with: 18
    fill_in 'house_rating_5i', with: 10
    fill_in 'Phone', with: '+12036174555'
    click_on 'Schedule Alert'

    expect(page).to have_content("Textmessage alert successfully scheduled")
  end

end
