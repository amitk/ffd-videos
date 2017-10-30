class Content
  include Mongoid::Document

  field :name,        type: String
  # field :type,        type: String
  field :category,    type: String, default: 'free'
  # field :url,         type: String
  field :view_limit,  type: Integer, default: nil
  # To set the time span for viewing subscribed video
  field :view_span,   type: Integer, default: nil

  has_many :user_contents

  scope :free, -> { where(category: 'free')}
  scope :registered, -> { where(category: 'registered') }
  scope :subscribed, -> { where(category: 'subscribed') }

  # validates :name, :category, :url, presence: true
  validates :category, inclusion: { in: %w(free registered subscribed) }
  validate :view_limit_or_span

  mount_uploader :file, FileUploader

  private

  def view_limit_or_span
    if category == 'subscribed'
      if view_limit.nil? && view_span.nil?
        errors.add(:base, "Specify view limit or time limit for video")
      end
    end
  end

end
