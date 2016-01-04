
User.destroy_all
Cohort.destroy_all

# fiction = Genre.create!(name: 'Fiction')
# apple = Genre.create!(name: 'Apple')
# non_fiction = Genre.create!(name: 'Non-Fiction')
# 50.times do |n|
User.create!(
email: "test@test.com",
# t.string   "encrypted_password",     default: "", null: false
# t.string   "reset_password_token"
# t.datetime "reset_password_sent_at"
# t.datetime "remember_created_at"
# t.integer  "sign_in_count",          default: 0,  null: false
# t.datetime "current_sign_in_at"
# t.datetime "last_sign_in_at"
# t.inet     "current_sign_in_ip"
# t.inet     "last_sign_in_ip"
# t.datetime "created_at",                          null: false
# t.datetime "updated_at",                          null: false
role: "Student",
fname: "Keith",
lname: "Bob",
cohort_id: 104,
location: "Miami",
latitude: 25.7753,
longitude: -80.2089,
password: 'password',
password_confirmation: 'password'
)
Cohort.create!(
name: 'MIA 3',
location: 'Miami',
graddate: '1/3/2016'
)
# end


# 50.times do |n|
#   fname  = n+1
#   email = "example-#{n+1}@railstutorial.org"
#   role = 'User'
#   lname = n+1
#   cohort_id = 5
#   location = 'Miami'
#   latitude = 25.7753
#   longitude = 80.2089
#   password = "password"
#   password_confirmation = 'password'
#   cohort_id = 3
#   User.create!(fname:  fname,
#                email: email,
#                role: role,
#                lname: lname,
#                cohort_id: cohort_id,
#                location: location,
#                latitude: latitude,
#                longitude: longitude,
#                password: password,
#                cohort_id: cohort_id)
# end

# User.create!([{
#   email: '',
#   role: 'JK Rowling',
#   fname: 'Bacon ipsum dolor amet filet mignon beef flank bacon meatloaf, tongue tenderloin spare ribs ham hock leberkas venison pork loin shankle porchetta. Strip steak biltong pancetta chuck sirloin, boudin ball tip salami ham hock. Shankle tri-tip shank beef pork belly jowl kevin sirloin pastrami ball tip hamburger pork chop picanha tongue. Frankfurter venison porchetta ground round spare ribs tongue flank, rump tri-tip chicken.',
#   lname: '0053285768',
#   cohort_id: 5,
#   location: 10.days.ago,
#   latitude: ,
#   longitude: ,
# },
# {
#   title: 'The Game',
#   author: 'Neil Straus',
#   description: 'Bacon ipsum dolor amet shank short ribs flank drumstick ground round. Brisket corned beef tail capicola pork loin tongue. Hamburger pancetta ham hock, kielbasa turducken picanha pork chop tongue alcatra sirloin jerky fatback landjaeger. Ribeye strip steak andouille, porchetta ground round shankle hamburger. T-bone kielbasa pastrami pork chop.',
#   amazon_id: '0348590B2',
#   rating: 2,
#   finished_on: nil,
#   genres: [non_fiction]
# },
# {
#   title: 'Wolf of Wall Street',
#   author: 'Jordan Belford',
#   description: 'Bacon ipsum dolor amet shank short ribs flank drumstick ground round. Brisket corned beef tail capicola pork loin tongue. Hamburger pancetta ham hock, kielbasa turducken picanha pork chop tongue alcatra sirloin jerky fatback landjaeger. Ribeye strip steak andouille, porchetta ground round shankle hamburger. T-bone kielbasa pastrami pork chop.',
#   amazon_id: '23948BG5',
#   rating: 5,
#   finished_on: 20.days.ago,
#   genres: [non_fiction, apple]
#   }])

  p "Created #{User.count} Users"
