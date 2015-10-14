class SessionsController < ApplicationController

	skip_before_filter :require_user, :only => [:new, :create]

	def new
		puts "NEW SESSIOnS_controller!"
	end

	def create
		user = User.find_by(email: params[:session][:email])

		if user
			session[:user_id] = user.id
			#redirect_to user_path

			puts "found user!"
			puts user.id

			




			redirect_to user_path(session[:user_id])
		else
			# signin page

			puts "new new"

			redirect_to user_path
			
			# render "new"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url
	end
end
