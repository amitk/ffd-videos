FactoryGirl.define do
  factory :video do
    name { Faker::Name.title }
    duration { Faker::Number.number(8) }
  end
end
