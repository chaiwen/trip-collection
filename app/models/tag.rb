class Tag
  include Mongoid::Document

  # trips and activities can be tagged
  has_and_belongs_to_many :tagable, polymorphic: true
  
  field :name, type: String

end
