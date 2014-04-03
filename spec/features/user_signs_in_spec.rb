require 'spec_helper'

feature 'user signs in', %q{
as an already registered user
I want to sign up for an account
so that I can take advantage of the site's features
} do

  scenario "user signs in with valid information" do
    user = FactoryGirl.create(:user)
    visit root_path
    click_on 'Sign in'
    form_filler(user)
    click_on 'Sign in'

    expect(page).to have_content("Signed in as #{user.username}")
  end

  scenario "user wants to sign in but doesn't enter complete information" do
    user = FactoryGirl.create(:user)
    fields = ['Email', 'Password']
    fields.each do |field|
      visit root_path
      click_on 'Sign in'
      form_filler(user)
      fill_in field, with: ""
      click_on 'Sign in'

    expect(page).to have_content("Sign in")
    end
  end
end
