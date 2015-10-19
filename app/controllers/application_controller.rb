class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  before_filter :require_user # before every action run this code, continue if true


  def require_user
    puts "require_user-------------?????"
    
  	if current_user
		  return true
	  end
    puts "RETURNING TO ROOOOOT"
	  redirect_to root_url
  end
end
