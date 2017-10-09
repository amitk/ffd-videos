FactoryGirl.define do
  factory :video do
    name { Faker::Name.title }
    url { Faker::Internet.url }
  end
end
