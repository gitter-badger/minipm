require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.login                 { Faker::Internet.user_name }
    f.email                 { Faker::Internet.safe_email }
    f.password              'secret'
    f.password_confirmation 'secret'
  end
end