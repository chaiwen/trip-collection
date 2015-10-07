class Trip
  include Mongoid::Document

  has_many :activities
  embeds_one :user
  has_and_belongs_to_many :users
  has_many :reviews, as: :reviewable
  has_many :tags, as: :tagable

  field :title, type: String
  field :rating, type: Float
  field :description, type: String
  field :date, type: String
end
