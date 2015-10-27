class SessionsController < ApplicationController

	skip_before_filter :require_user, :only => [:new, :create]

	def new
		puts "------------------>sessions controller: new"
	end

	def create
		puts "------------------>sessions controller: create"

# params = { session: {password: "", email: "" } }
		user = User.find_by(email: params[:session][:email].downcase)

		if user && user.authenticate(params[:session][:password])
			puts "found user!"

			log_in user
			redirect_to user



			#redirect_to user_path(session[:user_id])
		else
			# signin page

			flash.now[:danger] = 'Invalid email/password combination' #.now displaying on rendered vs req pages
			puts "user not found!"
			
			render 'new'
		end
	end

	def destroy
		log_out
		redirect_to root_url
	end
end
