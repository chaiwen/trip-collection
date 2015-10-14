class Tag
  include Mongoid::Document

  has_and_belongs_to_many :trips
  has_and_belongs_to_many :activities
  
  #############################################################################

  field :name, type: String

  # must be unique, no duplicate categories
  validates :name, uniqueness: true
  
end
