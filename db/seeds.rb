10.times do |n|
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

10.times do |n| labels_test = Label.create!([name: "Task#{n + 1}"]) end

10.times do |n|
  Task.create!(
    title: "No.#{n + 1} task",
    details: 'task_detail',
    expired_at: '2022-09-05 00:00:00',
    status: '未着手',
    priority: 2,
    user_id:  User.first.id + n
  )
end