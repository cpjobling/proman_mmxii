require 'factory_girl'

Factory.define :user do |u|
  u.name 'Test User'
  u.email 'user@swansea.ac.uk'
  u.password 'please'
  u.password_confirmation 'please'
  u.first_name 'Test'
  u.last_name 'User'
end