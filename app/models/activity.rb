class Activity
  include Mongoid::Document
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
