3.times do |n|
  name = Faker::Name.name 
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               )
end

User.create!(name:  "Example User",
             email: "example@example.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)