class Trip
  include Mongoid::Document

  belongs_to 	:user # author
  belongs_to	:user, inverse_of: :saved_trips # bookmarked

  has_and_belongs_to_many 		:activities 			# trip is composed of these activities

  has_many 		:reviews, :as => :reviewable # trip reviews

  # has and belongs to many??
  has_many :tags, as: :tagable # tagged categories

  #############################################################################

  field :title, type: String
  field :rating, type: Float
  field :description, type: String
  field :date, type: String
end
