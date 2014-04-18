require 'spec_helper'

feature 'user adds time/date/phone', %q{
  as a user
  i want to add a house showing time, date and phone
  so that I can remember when the house has a showing and can visit the house
  } do

  scenario 'user adds textmessage day and time on the houses individual page' do
    user = FactoryGirl.create(:user)
    house = FactoryGirl.build(:house)
    #user signs in
    # visit root_path
    # click_on 'Sign In'
    # form_filler(user)
    # click_on 'Sign In'
    visit new_house_path
    form_filler(user)
    click_on 'Sign in'
    house_new_helper(house)
    click_on 'Add House'
    click_on 'SHOW'

    #user adds textmessage alert
    within("#datetime_picker") do
    fill_in 'textmessage_date_time_1i', with: 2014
    fill_in "textmessage_date_time_2i", with: "April"
    fill_in 'textmessage_date_time_3i', with: 16
    fill_in 'textmessage_date_time_4i', with: 18
    fill_in 'textmessage_date_time_5i', with: 10
    fill_in 'Phone', with: '+12036174555'
    click_on 'Schedule Alert'
    end

    expect(page).to have_content("Textmessage alert successfully scheduled")
  end

end
