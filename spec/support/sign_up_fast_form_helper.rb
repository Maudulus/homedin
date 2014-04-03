module SignUpFastHelper
  def join_form_filler(valid_attrs)
    fill_in 'Username', with: valid_attrs.username
    fill_in 'Email', with: valid_attrs.email
    fill_in 'user_password', with: valid_attrs.password
    fill_in 'user_password_confirmation', with: valid_attrs.password
  end
end
