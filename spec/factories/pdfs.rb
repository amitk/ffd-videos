FactoryGirl.define do
  factory :pdf do
    name { Faker::Name.title }
    url { Faker::Internet.url }
  end
end
