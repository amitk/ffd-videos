require 'rails_helper'

RSpec.describe Video, type: :model do

  it "should raise error if subscribed video is created without view_limit or view_span" do
    video = build :video, category: 'subscribed'
    video.valid?
    expect(video.errors.size).to eq(1)
  end

  it "should not raise error if subscribed video is created with view_limit or view_span" do
    video_1 = build :video, category: 'subscribed', view_limit: 5
    video_1.valid?
    expect(video_1.errors.size).to eq(0)
    video_2 = build :video, category: 'subscribed', view_span: 234323
    video_2.valid?
    expect(video_2.errors.size).to eq(0)
  end

  it "should create a content if video is created" do
    video = create :video
    expect(Content.count).to eq(1)
    expect(Video.count).to eq(1)
  end

end
