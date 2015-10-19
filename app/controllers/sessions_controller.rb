class SessionsController < ApplicationController

	skip_before_filter :require_user, :only => [:new, :create]

	def new
		puts "------------------>sessions controller: new"
	end

	def create
		puts "------------------>sessions controller: create"

		user = User.find_by(email: params[:session][:email].downcase)

		if user && user.authenticate(params[:session][:password])
			puts "found user!"

			log_in user
			redirect_to user



			#redirect_to user_path(session[:user_id])
		else
			# signin page

			flash[:danger] = 'Invalid email/password combination'
			puts "user not found!"
			
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url
	end
end
