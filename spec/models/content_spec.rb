require 'rails_helper'

RSpec.describe Content, type: :model do

  it { should validate_presence_of(:category) }

  it "should return free contents" do
    content_4 = create :content
    content_1 = create :content
    content_2 = create :content, category: 'registered'
    content_3 = create :content, category: 'subscribed', view_limit: 5
    expect(Content.free.count).to equal(2)
    expect(Content.free.to_a).not_to include(content_2)
    expect(Content.free.to_a).not_to include(content_3)
  end

  it "should return registered contents" do
    content_1 = create :content
    content_2 = create :content, category: 'registered'
    content_3 = create :content, category: 'subscribed', view_limit: 10
    content_4 = create :content, category: 'registered'
    expect(Content.registered.count).to equal(2)
    expect(Content.registered.to_a).not_to include(content_1)
    expect(Content.registered.to_a).not_to include(content_3)
  end

  it "should return subscribed contents" do
    content_1 = create :content
    content_2 = create :content, category: 'registered'
    content_3 = create :content, category: 'subscribed', view_span: 12341
    content_4 = create :content, category: 'subscribed', view_limit: 5
    content_5 = create :content, category: 'subscribed', view_limit: 7, view_span: 12321
    expect(Content.subscribed.count).to equal(3)
    expect(Content.subscribed.to_a).not_to include(content_1)
    expect(Content.subscribed.to_a).not_to include(content_2)
  end

  it "subscribed content should have view_limit or view_span or both" do
    content = build :content, category: 'subscribed'
    content.valid?
    expect(content.errors.size).to eq(1)
    content_1 = build :content, category: 'subscribed', view_limit: 5
    content_1.valid?
    expect(content_1.errors.size).to eq(0)
    content_2 = build :content, category: 'subscribed', view_span: 231354
    content_2.valid?
    expect(content_2.errors.size).to eq(0)
    content_3 = build :content, category: 'subscribed', view_limit: 5, view_span: 608400
    content_3.valid?
    expect(content_3.errors.size).to eq(0)
  end

  it "should create content if a video is created" do
    video = create :video
    expect(Content.count).to eq(1)
    expect(Video.count).to eq(1)
    expect(Pdf.count).to eq(0)
  end

  it "should create content if a pdf is created" do
    pdf = create :pdf
    expect(Content.count).to eq(1)
    expect(Video.count).to eq(0)
    expect(Pdf.count).to eq(1)
  end
end
