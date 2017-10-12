class UserContent
  include Mongoid::Document
  field :view_count,  type: Integer

  belongs_to :user
  belongs_to :content

end
