require 'factory_girl'

Factory.define :user do |user|
  user.email 'test.user@swansea.ac.uk'
  user.password 'please'
  user.password_confirmation 'please'
  user.first_name 'Test'
  user.last_name 'User'
end