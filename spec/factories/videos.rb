FactoryGirl.define do
  factory :video do
    name { Faker::Name.title }
    duration { Faker::Numbe.url }
  end
end
