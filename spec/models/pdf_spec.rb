require 'rails_helper'

RSpec.describe Pdf, type: :model do
  it "should raise error if subscribed pdf is created without view_limit or view_span" do
    pdf = build :pdf, category: 'subscribed'
    pdf.valid?
    expect(pdf.errors.size).to eq(1)
  end

  it "should not raise error if subscribed pdf is created with view_limit or view_span" do
    pdf_1 = build :pdf, category: 'subscribed', view_limit: 5
    pdf_1.valid?
    expect(pdf_1.errors.size).to eq(0)
    pdf_2 = build :pdf, category: 'subscribed', view_span: 234323
    pdf_2.valid?
    expect(pdf_2.errors.size).to eq(0)
  end

  it "should create a content if pdf is created" do
    pdf = create :pdf
    expect(Content.count).to eq(1)
    expect(Pdf.count).to eq(1)
  end
end
