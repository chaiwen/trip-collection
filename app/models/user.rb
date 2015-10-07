class User
  include Mongoid::Document

  #has_many :trips
  #has_many :activities
  #has_one  :photo, as: :photoable
  #has_many :users # friend list?


  # embeds_one 	:profile_photo, class_name: "Photo", inverse_of: :photoable
  #has_many		:uploaded_photo, class_name: "Photo", inverse_of: :photoable
  #belongs_to	:liked_photo, class_name: "Photo", inverse_of: :photoable

  # uploaded photos
  has_many		:photos

  # liked photo, part of liker list in photo
  belongs_to	:photo, inverse_of: :liker # maybe don't need? 


  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :password, type: String


  field :photo_url, type: String
  field :photo_date, type: String

  # update view
end
