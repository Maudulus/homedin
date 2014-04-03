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

      expect(User.count).to eq(count + 1)
      expect(page).to have_content("Signed in as #{user.username}")
    end

    scenario 'user registers with invalid information and gets denied access' do
      fields = ['Username', 'Email']
      user = FactoryGirl.build(:user)
      fields.each do |field|
        visit root_path
        click_on 'Sign up'
        join_form_filler(user)
        fill_in field, with: ""
        click_on 'Sign up'

        expect(page).to have_content("#{field}can't be blank")
      end
    end

      scenario 'user registers without filling in password and is denied access' do
        user = FactoryGirl.build(:user)
          visit root_path
          click_on 'Sign up'
          join_form_filler(user)
          fill_in "user_password", with: ""
          click_on 'Sign up'

          expect(page).to have_content("Passwordcan't be blank")
        end
      end


