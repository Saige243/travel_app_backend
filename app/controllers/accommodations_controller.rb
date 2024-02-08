class AccommodationsController < ApplicationController
  before_action :set_trip
  before_action :set_accommodation, only: [:show, :edit, :update, :destroy]

  def index
    @accommodations = @trip.accommodations
    render json: @accommodations
  end

  def show
    render json: @accommodation
  end

  def new
    @accommodation = @trip.accommodations.build
  end

  def create
    @accommodation = @trip.accommodations.build(accommodation_params)
    if @accommodation.save
      render json: { message: 'Accommodation was successfully created.', accommodation: @accommodation }, status: :created
    else
      render json: @accommodation.errors, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @accommodation.update(accommodation_params)
      render json: { message: 'Accommodation was successfully updated.', accommodation: @accommodation }, status: :ok
    else
      render json: @accommodation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @accommodation.destroy
      render json: { message: 'Accommodation was successfully destroyed.' }, status: :ok
    else
      render json: { message: 'Failed to destroy accommodation.' }, status: :unprocessable_entity
    end
  end

  private

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def set_accommodation
    @accommodation = @trip.accommodations.find(params[:id])
  end

  def accommodation_params
    params.require(:accommodation).permit(:name, :address, :check_in_date, :check_out_date, :contact_number, :notes)
  end
end
