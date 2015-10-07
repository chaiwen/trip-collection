class Review
  include Mongoid::Document

  # reviews of trips, individual activities
  embedded_in :reviewable, polymorphic: true
  embeds_one :user


  field :text, type: String
  field :date, type: String
  field :rating, type: Float
end
