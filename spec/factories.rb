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
  factory :flashcard do
    primary_language_word { "Apfel" }
    target_language_word { "Apple" }
    default { false }
  end
end

FactoryBot.define do
  factory :category do
    name { "Fruits" }
    default { false }
  end
end

FactoryBot.define do
  factory :user_flashcard do
    success { false }
    failed { true }
  end
end
