class TripsController < ApplicationController
  before_action :set_trip, only: %i[ show edit update destroy ]

  # GET /trips or /trips.json
  def index
    @trips = current_user.trips
    render json: @trips
  end

  # GET /trips/1 or /trips/1.json
  def show
    render json: @trip
  end

  # GET /trips/new
  def new
    @trip = Trip.new
  end

  # GET /trips/1/edit
  def edit
  end

  # POST /trips or /trips.json
  def create
    @trip = current_user.trips.new(trip_params)


    respond_to do |format|
      if @trip.save
        format.html { redirect_to trip_url(@trip), notice: "Trip was successfully created." }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1 or /trips/1.json
  def update
    respond_to do |format|
      if @trip.update(trip_params)
        # format.html { redirect_to trip_url(@trip), notice: "Trip was successfully updated." }
        format.json { render :show, status: :ok }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1 or /trips/1.json
  def destroy
    @trip.destroy!

    respond_to do |format|
      format.html { redirect_to trips_url, notice: "Trip was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Trip not found" }, status: :not_found
    end

    # Only allow a list of trusted parameters through.
    def trip_params
      params.require(:trip).permit(:title, :description, :user_id, :location, :start_date, :end_date)
    end
end
