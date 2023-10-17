require 'faker'

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.unique.email }
    password { "123456" }
  end

  factory :call do
    duration { 20 }
  end

  factory :message do
    text { Faker::Lorem.sentence }
  end

  factory :translation do
    primary_language_word { "Apfel" }
    target_language_word { "Apple" }
    default { false }
  end

  factory :review do
    rating { Faker::Number.between(from: 1, to: 5) }
  end

  factory :category do
    name { "Fruits" }
    default { false }
  end

  factory :user_flashcard do
    success { true }
    failed { false }
  end
end
