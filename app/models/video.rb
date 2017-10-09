class Video
  include Mongoid::Document

  field :name,        type: String
  field :type,        type: String, default: 'free'
  field :url,         type: String
  field :view_limit,  type: Integer, default: nil
  # To set the time span for viewing subscribed video
  field :view_span,   type: Integer, default: nil

  validates :name, :type, :url, presence: true
  validates :type, inclusion: { in: %w(free registered subscribed) }
  validate :view_limit_or_span

  has_many :user_videos

  scope :free, -> { where(type: 'free')}
  scope :registered, -> { where(type: 'registered') }
  scope :subscribed, -> { where(type: 'subscribed') }

  private

  def view_limit_or_span
    if type == 'subscribed'
      if view_limit.nil? && view_span.nil?
        errors.add(:base, "Specify view limit or time limit for video")
      end
    end
  end

end
