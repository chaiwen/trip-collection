class Trip
  include Mongoid::Document

  belongs_to :user # author
  has_and_belongs_to_many :savers, class_name: "User", inverse_of: :saved_trips # bookmarked

  has_and_belongs_to_many :activities # trip is composed of these activities
  has_and_belongs_to_many :tags # tagged categories

  has_many 		:reviews, as: :reviewable # trip reviews


  #############################################################################

  field :title, type: String
  field :rating, type: Float
  field :description, type: String
  field :date, type: String
end
