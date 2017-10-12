FactoryGirl.define do
  factory :content do
    name { Faker::Name.title }
    url { Faker::Internet.url }
  end
end
