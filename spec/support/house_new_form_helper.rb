module HouseNewHelper
  def house_new_helper(valid_attrs)
    fill_in 'Price', with: valid_attrs.price
    fill_in 'Town', with: valid_attrs.town
    fill_in 'Description', with: valid_attrs.description
    fill_in 'Bedrooms', with: valid_attrs.bedrooms
    fill_in 'Bathrooms', with: valid_attrs.bathrooms
    fill_in 'URL', with: valid_attrs.url
  end
end
