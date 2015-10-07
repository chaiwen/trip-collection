class Tree
  include Mongoid::Document

  field :species, type: String
  field :species_common, type:String
  field :species_latin, type:String
  field :diameter, type: Integer
  field :condition, type: String

  field :addr_num, type: String
  field :addr_st, type: String
  field :addr_zip, type: String
  field :neighborhood, type: String
  field :latitude, type: Float
  field :longitude, type: Float

end