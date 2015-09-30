class Trip
  include Mongoid::Document
  field :title, type: String
  field :rating, type: Float
  field :description, type: String
  field :date, type: String
end
