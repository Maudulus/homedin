module SignInFastHelper
  def form_filler(valid_attrs)
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
  end
end
