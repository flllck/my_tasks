FactoryBot.define do
  factory :project do
    title { Faker::Lorem.word }

    trait :invalid do
      title { nil }
    end
  end
end
