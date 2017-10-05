require 'rails_helper'

RSpec.describe User, type: :model do
  it "registered user must have a name" do
    user = create :user
    expect(user.name).to be_truthy
  end

  it "registered user must have a email" do
    user = create :user
    expect(user.email).to be_truthy
  end

  it "registered user must have a password" do
  end

  it "registered user cannot upload videos" do
  end

  it "registered user can view free and registered videos" do
  end

  it "registered user can't view subscribed videos" do
  end

  it "subscribed user must be a registered user" do
  end

  it "subscribed user must have a name" do
  end

  it "subscribed user must have a email" do
  end

  it "subscribed user must have a password" do
  end

  it "subscribed user must have payment details" do
  end

  it "subscribed user can view free, registered and subscribed video" do
  end

  it "subscribed user can't upload videos" do
  end

  it "user with role admin can upload videos" do
  end

  it "user with role admin can delete videos" do
  end

  it "user with role admin can view free, registered and subscribed video" do
  end
end
