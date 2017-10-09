class UserVideo
  include Mongoid::Document
  field :view_count,  type: Integer

  belongs_to :user
  belongs_to :video

end
