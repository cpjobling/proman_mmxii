require 'factory_girl'

Factory.define :user do |user|
  user.email 'test.user@swansea.ac.uk'
  user.password 'please'
  user.password_confirmation 'please'
  user.first_name 'Test'
  user.last_name 'User'
end

Factory.define :admin do |user|
  user.email 'thierrry.administrator@swansea.ac.uk'
  user.password 'administrate'
  user.password_confirmation 'administrate'
  user.first_name 'Thierry'
  user.last_name 'Administrator'
end

Factory.define :student do |student|
  student.email '123456@swansea.ac.uk'
  student.password 'studious'
  student.password_confirmation 'studious'
  student.first_name 'Alice'
  student.last_name 'Bright'
  student.title 'Ms'
end

Factory.define :supervisor do |supervisor|
  supervisor.email 'S.T.C.Academic@swansea.ac.uk'
  supervisor.password 'academical'
  supervisor.password_confirmation 'academical'
  supervisor.first_name 'Strictly'
  supervisor.last_name 'Academic'
  supervisor.title 'Dr'
end