class Activity
  include Mongoid::Document

  has_many :reviews, as: :reviewable, dependent: :destroy
  has_and_belongs_to_many: tags
  has_and_belongs_to_many: trips
  has_many: photos, as: :photoable
  has_and_belongs_to_many: user
  embeds_one: user

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
