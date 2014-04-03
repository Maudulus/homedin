FactoryGirl.define do
  factory :user do
    username 'TS Eliot'
    email 'tsl@gmail.com'
    password '12345678'
  end

  factory :house do
    price 300000
    town 'Dorchester'
    description 'Beautiful mansion filled with beautiful things'
    bedrooms 5
    bathrooms 5
  end
end

