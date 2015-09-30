class Review
  include Mongoid::Document

  embedded_in :reviewable
  embeds_one :user


  field :text, type: String
  field :date, type: String
  field :rating, type: Float
end
