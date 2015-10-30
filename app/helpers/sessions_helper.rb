module SessionsHelper
	# Logs in the given user.
	def log_in(user)
		session[:user_id] = user.id # places temp cookie on user's browser containing encrypted version of user id
		# temp cookie expires immediately when browser is closed

		puts "USER LOGGED IN!!!!"
		#puts user.id
		#puts session[:user_id]
	end
	# log out
	def log_out
		session.delete(:user_id)
		session[:user_id] = nil
		@current_user = nil
	end

	# Returns the current logged-in user (if any).
	# useful for <%= current_user.name %> and redirect_to current_user
	# user's id is placed securely in temp session, retrieve it on subsequent pages
	# find user in db corresponding to session id
	def current_user
		#return unless session[:user_id]
		#

		puts "------------------>sessions_helper: current_user------------------->"
		puts session[:user_id] # $oid
		puts params[:id] # id

		# so it doesn't hit database multiple times for each appearance on page
		# find raises exception if user id doesn't exist
		# if @current_user.nil?

		#session.delete(:user_id)

		@current_user ||= User.find(session[:user_id]) if session[:user_id]
		#debugger

	end

	# Returns true if the user is logged in, false otherwise.
	def logged_in?
		puts "CHECKING IF LOGGEDIN!------------------->"
		!current_user.nil?
	end
end
