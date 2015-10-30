class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_filter :require_user, :only => [:new, :create]

  # GET /users
  # GET /users.json
  def index
    puts "DEF INDEX USER CONTROLLER!"
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show # show.html
    @user = User.find(params[:id])
    @activities = @user.activities#.paginate(page: params[:page])
    puts "SHOW USER!!!!!"
    #debugger # can use rails console to check vars and state!
  end

  # GET /users/new
  def new
    puts "USER#NEW!!!!!!!"
    # this is required as argument for form_for
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    puts "EDIT??"
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        log_in @user # login user after creating account
        flash[:success] = "Welcome to trip-collections!"
        format.html { redirect_to @user, notice: 'User was successfully created.' } # redirect_to user_url(@user)
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new } # render 'new'
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update(user_params)
      #if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
        #format.json {head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      puts "------------------>users controller: set_user"
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      puts "------------------>sessions controller: user_params"
      params.require(:user).permit(:first_name, :last_name, :user_name, :email, :password, :password_confirmation)
    end
end
