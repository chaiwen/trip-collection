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
  field :password_digest, type: String # for authenticating password

  # profile photo
  field :photo_url, type: String
  field :photo_date, type: String


  validates :email, presence: true, length: { maximum: 255 },
  					format: { with: VALID_EMAIL REGEX },
  					uniqueness: {case_sensitive: false}

  validates :user_name, uniqueness: true
  #has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  # custom validation
  #validate :user_cannot_follow_self
  	
  #end

  before_validation on: :create do |document|

  	puts "BEFORE UPDATE!!!"
  	puts document.as_document
  	if user_name == :user_id
  		errors.add(:followers, "user cannot follow self!")
  	end
  end

  has_secure_password


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
