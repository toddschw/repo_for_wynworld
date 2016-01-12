
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Cohort.destroy_all

User.create!(
name: 'German Nieto',
email: "german@german.com",
role: "Student",
location: "Miami",
latitude: 25.7753,
longitude: -80.2089,
password: 'password',
password_confirmation: 'password',
admin: true
)
50.times do |n|
User.create!(
name: 'Bill Cosby',
email: "test#{n}@test.com",
role: "Student",
location: "Miami",
latitude: 25.7753,
longitude: -80.2089,
password: 'password',
password_confirmation: 'password'
)
end
Cohort.create!(
name: 'MIA 3',
location: 'Miami',
graddate: '1/3/2016'
)
Company.create!(
)
Employment.create!(
)


p "Created #{User.count} Users"
