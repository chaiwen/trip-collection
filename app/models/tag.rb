class Tag
  include Mongoid::Document

  belongs_to :tagable, polymorphic: true
  
  field :name, type: String
end
