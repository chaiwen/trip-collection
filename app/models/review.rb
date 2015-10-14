class Review
  include Mongoid::Document

  # reviews of trips and activities
  belongs_to :reviewable, polymorphic: true
  belongs_to :user

  # set of associated photos??

  #############################################################################

  field :text, type: String
  field :date, type: String
  field :rating, type: Float


  validate :must_belong_to_reviewable

  def must_belong_to_reviewable
  	if reviewable == nil
  		errors.add(:reviewable, "Review must belong to a Trip or Activity!")
  	end
  end
end
