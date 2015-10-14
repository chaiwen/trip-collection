class User
  include Mongoid::Document

  #has_one  :photo, as: :photoable
  #embeds_one 	:profile_photo, class_name: "Photo", inverse_of: :photoable
  #has_many		:uploaded_photo, class_name: "Photo", inverse_of: :photoable
  #belongs_to	:liked_photo, class_name: "Photo", inverse_of: :photoable
  
  #has_many	:friendships					# friends list
  
  has_and_belongs_to_many :followers, class_name: "User", inverse_of: :following
  has_and_belongs_to_many :following, class_name: "User", inverse_of: :followers

  has_many		:activities 								# author of Activity
  has_many		:saved_activities, class_name: "Activity", inverse_of: :savers 	# bookmarked Activities

  has_many		:trips 										# author of Trip
  has_and_belongs_to_many :saved_trips, class_name: "Trip", inverse_of: :savers			# bookmarked Trips

  has_many		:reviews, as: :reviewable 					# reviews the user wrote
  has_many		:photos										# uploaded photos

  # liked photo, part of liker list in photo
  # because it's nil in photo. belongs_to	:photo, inverse_of: :liker # maybe don't need? 

  #############################################################################

  field :first_name, type: String
  field :last_name, type: String
  field :user_name, type: String
  field :email, type: String
  field :password, type: String

  # profile photo
  field :photo_url, type: String
  field :photo_date, type: String


  # custom validation
  validate :email_and_user_name_unique
  def email_and_user_name_unique
  	if email == nil
  		errors.add(:email, "email required!")
  	end

  	if user_name == nil
  		errors.add(:user_name, "user_name required and must be unique!")
  	end
  end

  # update view
=begin

  

  before_create :send_message
  after_save do |document|
  	# handle callback here.
  end

  protected
  def send_message
  	# message sending code here
  end
=end

end
