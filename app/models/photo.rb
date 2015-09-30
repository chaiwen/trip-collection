class Photo
  include Mongoid::Document

  embedded_in :photoable, polymorphic: true
  embeds_one  :user

  field :URL, type: String
  field :caption, type: String
  field :date, type: String
  field :rating, type: Float
end
