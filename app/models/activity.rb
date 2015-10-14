class Activity
  include Mongoid::Document

  belongs_to  :user # author
  has_and_belongs_to_many  :savers, class_name: "User", inverse_of: :saved_activities # bookmarked

  has_and_belongs_to_many    :trips  # trip is composed of these activities
  has_and_belongs_to_many :tags # tagged categories

  has_many    :photos   # photos of activity
  has_many :reviews, as: :reviewable


#.as_document


  #############################################################################

  field :name, type: String
  field :address, type: String
  field :city, type: String
  field :country, type: String
  field :lat, type: Float
  field :lng, type: Float
  field :days, type: Fixnum
  field :hrs, type: Fixnum
  field :rating, type: Float
  field :description, type: String
  field :cost, type: Float
  field :date, type: String
end
