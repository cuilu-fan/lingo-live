require 'faker'

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.unique.email }
    password { "123456" }
  end
end

FactoryBot.define do
  factory :call do
    duration { 20 }
  end
end
