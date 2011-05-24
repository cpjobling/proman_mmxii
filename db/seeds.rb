# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create!(:email => 'a.lecturer@swansea.ac.uk',
  :password => 'please', :password_confirmation => 'please',
  :first_name => "Anthony", :last_name => "Lecturer")
user.confirm!
puts 'New user created: ' << user.email
puts 'SETTING UP ADMIN USER LOGIN'
admin = User.create!(:email => 'c.p.jobling@swansea.ac.uk',
  :password => 'foobar', :password_confirmation => 'foobar',
  :title => "Dr", 
  :first_name => "Christopher", :initials => "P.", :last_name => "Jobling",
  :known_as => "Chris")
admin.confirm!
admin.roles << :admin
admin.save!
puts 'Admin user created: ' << admin.email << "\n"
puts "Don't forget to change your password!"
