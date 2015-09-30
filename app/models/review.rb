class Review
  include Mongoid::Document
  field :text, type: String
  field :date, type: String
  field :rating, type: Float
  embedded_in :reviewable
end
