class Activity
	include Mongoid::Document

	field :name,		:type => String
	field :address,		:type => String
	field :city,		:type => String
	field :country,		:type => String
	field :lengthDays,	:type => Fixnum
	field :lengthHours,	:type => Fixnum
	field :rating,		:type => Float
	field :description,	:type => String
	field :cost,		:type => Float

end