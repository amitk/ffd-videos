require 'rails_helper'

RSpec.describe Video, type: :model do
  it { should validate_presence_of(:name ) }

  it { should validate_presence_of(:duration) }

  it { should validate_presence_of(:type) }

  it "should return free videos" do
    video_4 = create :video
    video_1 = create :video
    video_2 = create :video, type: 'registered'
    video_3 = create :video, type: 'subscribed', view_limit: 5
    expect(Video.free.count).to equal(2)
    expect(Video.free.to_a).not_to include(video_2)
    expect(Video.free.to_a).not_to include(video_3)
  end

  it "should return registered videos" do
    video_1 = create :video
    video_2 = create :video, type: 'registered'
    video_3 = create :video, type: 'subscribed', view_limit: 10
    video_4 = create :video, type: 'registered'
    expect(Video.registered.count).to equal(2)
    expect(Video.registered.to_a).not_to include(video_1)
    expect(Video.registered.to_a).not_to include(video_3)
  end

  it "should return subscribed videos" do
    video_1 = create :video
    video_2 = create :video, type: 'registered'
    video_3 = create :video, type: 'subscribed', view_span: 12341
    video_4 = create :video, type: 'subscribed', view_limit: 5
    video_5 = create :video, type: 'subscribed', view_limit: 7, view_span: 12321
    expect(Video.subscribed.count).to equal(3)
    expect(Video.subscribed.to_a).not_to include(video_1)
    expect(Video.subscribed.to_a).not_to include(video_2)
  end

  it "subscribed video should have view_limit or view_span or both" do
    video = build :video, type: 'subscribed'
    video.valid?
    expect(video.errors.size).to eq(1)
    video_1 = build :video, type: 'subscribed', view_limit: 5
    video_1.valid?
    expect(video_1.errors.size).to eq(0)
    video_2 = build :video, type: 'subscribed', view_span: 231354
    video_2.valid?
    expect(video_2.errors.size).to eq(0)
    video_3 = build :video, type: 'subscribed', view_limit: 5, view_span: 608400
    video_3.valid?
    expect(video_3.errors.size).to eq(0)
  end
end
