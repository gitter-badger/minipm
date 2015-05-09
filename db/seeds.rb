55.times do
  User.create(
    login: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: 'secret',
    password_confirmation: 'secret'
  )
end

User.first.projects.create(
  title: Faker::App.name,
  description: Faker::Hacker.say_something_smart,
  due_date: 1.weeks.ago,
  owner_id: User.first.id
)
