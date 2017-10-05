class User
  include Mongoid::Document

  field :name,        type: String
  field :email,       type: String
  field :subscribe,   type: Boolean, default: false

  validates :name, :email, presence: true
  validates_email_format_of :email, message: "Invalid email address"

  scope :registered, -> { where(subscribe: false) }
  scope :subscribed, -> { where(subscribe: true) }

end
