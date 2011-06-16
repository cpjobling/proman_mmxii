require 'factory_girl'

Factory.define :user do |user|
  user.email 'test.user@swansea.ac.uk'
  user.password 'please'
  user.password_confirmation 'please'
  user.first_name 'Test'
  user.last_name 'User'
end

Factory.define :email_confirmed_user, :parent => :user do |user|
  user.after_create { |u| u.confirm! }
end

Factory.define :admin, :parent => :email_confirmed_user do |user|
  user.after_build { |u| u.roles << :admin }
end

Factory.define :student do |student|
  student.email '123456@swansea.ac.uk'
  student.password 'studious'
  student.password_confirmation 'studious'
  student.first_name 'Alice'
  student.last_name 'Bright'
  student.title 'Ms'
  student.after_create { |u| u.confirm! }
end

Factory.define :supervisor do |supervisor|
  supervisor.email 'S.T.C.Academic@swansea.ac.uk'
  supervisor.password 'academical'
  supervisor.password_confirmation 'academical'
  supervisor.first_name 'Strictly'
  supervisor.last_name 'Academic'
  supervisor.title 'Dr'
  supervisor.after_create { |u| u.confirm! }
end