FactoryGirl.define do
  factory :user_video do

    association :user
    association :video
  end
end
