# Create first user
User.create(
  login: 'reza',
  email: 'reza@example.net',
  password: 'secret',
  password_confirmation: 'secret')

# Dummy user
50.times do
  User.create(
    login: Faker::Internet.user_name,
    email: Faker::Internet.safe_email,
    password: 'secret',
    password_confirmation: 'secret')
end
