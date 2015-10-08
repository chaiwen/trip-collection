class Review
  include Mongoid::Document

  # reviews of trips and activities
  belongs_to :reviewable, polymorphic: true
  belongs_to :user

  # set of associated photos??

  #############################################################################

  field :text, type: String
  field :date, type: String
  field :rating, type: Float
end
