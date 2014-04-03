require 'spec_helper'

feature 'user signs up ', %q{
as a user
I want to sign up for an account
so that I can take advantage of the site's features
} do

  scenario 'user registers with valid information' do
    count = User.count
    user = FactoryGirl.build(:user)
    visit root_path
    click_on 'Sign up'
    join_form_filler(user)
    click_on 'Sign up'

    expect(User.count).to eq(1)
    expect(page).to have_content("Signed in as #{user.username}")
  end



end
