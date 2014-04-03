module SignInFastHelper
  def form_filler(valid_attrs)
    fill_in 'Email', with: valid_attrs.email
    fill_in 'user_password', with: valid_attrs.password
  end
end
