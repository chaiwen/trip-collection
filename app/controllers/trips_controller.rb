class TripsController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy]
  before_action :set_trip, only: [:show, :edit, :add, :update, :destroy]
  skip_before_filter :require_user, :only => [:show]

  # GET /trips
  # GET /trips.json
  def index
    @trips = Trip.all
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
  end

  # GET /trips/new
  def new
    #@trip = Trip.new

    # activities all belong to a user, the author
    #@user = current_user
    @trip = current_user.trips.build if logged_in?
  end

  def add
    #@trip = Trip.new

    # activities all belong to a user, the author
    @user = current_user
    @activities = @user.activities

    #respond_to do |format|
     # if @trip.update(trip_params)
      #  format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
       # format.json { render :show, status: :ok, location: @trip }
   #   else
    #    format.html { render :edit }
     #   format.json { render json: @trip.errors, status: :unprocessable_entity }
  #    end
   # end
    
  end

  





  # GET /trips/1/edit
  def edit
    puts "EDIT??"
    @trip = Trip.find(params[:id])
  end

  # POST /trips
  # POST /trips.json
  def create

    puts "CREATE TRIPPPPPPPPPPPPPPPPPPPPPP"
    @trip = current_user.trips.build(trip_params)


    #@comment = @article.comments.build
    #@trip = Trip.new(trip_params)

    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update
    puts "UPDATE TRIPPPPPPPPPPPPPPPPPPPPPP"

    #@trip = Trip.find(params[:id])

    respond_to do |format|

      puts @trip
      puts "WHAT"
      puts trip_params


      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end


    #redirect_to trips_url

    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to trips_url, notice: 'Trip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please Log in."
        redirect_to login_url
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      params.require(:trip).permit(:title, :rating, :description, :date, :activity_ids)
    end
end
