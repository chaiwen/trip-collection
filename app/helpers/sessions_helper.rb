module SessionsHelper
	# Logs in the given user.
	def log_in(user)
		session[:user_id] = user.id
	end

	# Returns the current logged-in user (if any).
	def current_user
		#return unless session[:user_id]
		#@current_user ||= User.find(session[:user_id])

		puts "------------------>sessions_helper: current_user"
		puts session[:user_id]
		puts session[:user]
		puts params[:id]
		puts params[:user_id]

		if @current_user.nil?
			@current_user = User.find(params[:id]) if params[:id]
		end
	end

	# Returns true if the user is logged in, false otherwise.
	def logged_in?
		!current_user.nil?
	end
end
