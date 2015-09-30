class Photo
  include Mongoid::Document
  field :URL, type: String
  field :caption, type: String
  field :date, type: String
  field :rating, type: Float
  embedded_in :photoable
end
