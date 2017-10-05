require 'rails_helper'

RSpec.describe User, type: :model do
  it{ should validate_presence_of(:name) }

  it{ should validate_presence_of(:email)}

  it "should return registered users" do
    user_1 = create :user, subscribe: false
    user_2 = create :user, subscribe: false
    user_3 = create :user, subscribe: true
    user_4 = create :user, subscribe: false
    expect(User.registered.count).to equal(3)
    expect(User.registered.to_a).not_to include(user_3)
  end

  it "should return subscribed users" do
    user_1 = create :user, subscribe: true
    user_2 = create :user, subscribe: true
    user_3 = create :user, subscribe: false
    expect(User.subscribed.count).to equal(2)
    expect(User.subscribed.to_a).not_to include(user_3)
  end

  # it "registered user cannot upload videos" do
  # end
  #
  # it "registered user can view free and registered videos" do
  # end
  #
  # it "registered user can't view subscribed videos" do
  # end
  #
  # it "subscribed user must be a registered user" do
  # end
  #
  # it "subscribed user must have payment details" do
  # end
  #
  # it "subscribed user can view free, registered and subscribed video" do
  # end
  #
  # it "subscribed user can't upload videos" do
  # end
  #
  # it "user with role admin can upload videos" do
  # end
  #
  # it "user with role admin can delete videos" do
  # end
  #
  # it "user with role admin can view free, registered and subscribed video" do
  # end
end
