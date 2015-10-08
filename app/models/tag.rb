class Tag
  include Mongoid::Document

  # trips and activities can be tagged
  # has and belongs to many??
  belongs_to :tagable, polymorphic: true
  
  #############################################################################

  field :name, type: String

end
