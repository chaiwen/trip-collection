class Photo
  include Mongoid::Document

  #embedded_in :photoable, polymorphic: true # activities and user profile

  #optional?
  #embedded_in 	:photoable, class_name: "User", inverse_of: :profile_photo	# user profile pic

  belongs_to	:user # uploaded by user

  has_many		:likers, class_name: "User" #inverse_of: :liked_photo 	# users likes

  

  field :url, type: String
  field :caption, type: String
  field :date, type: String
  # field :rating, type: Float
  field :likes, type: Fixnum

end
