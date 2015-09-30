class User
  include Mongoid::Document

  has_many :trips
  has_many :activities
  has_one  :photo, as: :photoable
  has_many :users # friend list?

  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :password, type: String
end
