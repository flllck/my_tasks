FactoryBot.define do
  factory :todo do
    text { Faker::TvShows::Simpsons.character }
    isCompleted { false }
    project_id { nil }

    trait :invalid do
      text { nil }
    end
  end
end
