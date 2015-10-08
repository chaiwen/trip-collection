class User
  include Mongoid::Document

  #has_one  :photo, as: :photoable
  #embeds_one 	:profile_photo, class_name: "Photo", inverse_of: :photoable
  #has_many		:uploaded_photo, class_name: "Photo", inverse_of: :photoable
  #belongs_to	:liked_photo, class_name: "Photo", inverse_of: :photoable
  
  has_and_belongs_to_many	:users							# friends list
  
  has_many		:activities 								# author of Activity
  has_many		:saved_activities, class_name: "Activity" 	# bookmarked Activities

  has_many		:trips 										# author of Trip
  has_many		:saved_trips, class_name: "Trip" 			# bookmarked Trips

  has_many		:reviews, as: :reviewable 					# reviews the user wrote
  has_many		:photos										# uploaded photos

  # liked photo, part of liker list in photo
  belongs_to	:photo, inverse_of: :liker # maybe don't need? 

  #############################################################################

  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :password, type: String

  # profile photo
  field :photo_url, type: String
  field :photo_date, type: String




  # update view
=begin
  # custom validation example, mongoid
  validate :first_name_last_name_same_letter

  def first_name_last_name_same_letter
  	if first_name && last_name
  		if first_name.first != last_name.first
  			errors.add(:first_name, "Needs to have same first letter as last name.")
  		end
  	end
  end

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
