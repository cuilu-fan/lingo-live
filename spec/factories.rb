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
  factory :message do
    text { Faker::Lorem.sentence }
  end
end

FactoryBot.define do
  factory :review do
    rating { Faker::Number.between(from: 1, to: 5) }
  end
end
