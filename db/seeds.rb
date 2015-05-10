# Create users
55.times do
  User.create(
    login: Faker::Internet.user_name,
    email: Faker::Internet.safe_email,
    password: 'secret',
    password_confirmation: 'secret')
end
