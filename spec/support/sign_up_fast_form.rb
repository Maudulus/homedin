module JoinSignUp
  def join_form_filler(valid_attrs)
    fill_in 'Username', with: user.username
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password
  end
end
