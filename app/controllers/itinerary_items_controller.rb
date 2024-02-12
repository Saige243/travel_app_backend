class ItineraryItemsController < ApplicationController
  before_action :set_itinerary_item, only: %i[show update destroy]

  # GET /itinerary_items or /itinerary_items.json
  def index
    @trip = Trip.find(params[:trip_id])
    @itinerary_items = @trip.itinerary_items
    render json: @itinerary_items
  end


  # GET /itinerary_items/1 or /itinerary_items/1.json
  def show
    render json: @itinerary_item
  end

  # POST /itinerary_items or /itinerary_items.json
  def create
    if params[:itinerary_items]
      create_multiple
    elsif params[:itinerary_item]
      create_single
    else
      render json: { error: 'Invalid parameters' }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /itinerary_items/1 or /itinerary_items/1.json
  def update
    if @itinerary_item.update(itinerary_item_params)
      render json: @itinerary_item, status: :ok
    else
      render json: @itinerary_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /itinerary_items/1 or /itinerary_items/1.json
  def destroy
    if @itinerary_item.destroy
      render json: { notice: 'Itinerary item was successfully destroyed.' }, status: :ok
    else
      render json: { error: 'Failed to destroy the itinerary item.' }, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itinerary_item
      @itinerary_item = ItineraryItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def itinerary_item_params
      params.require(:itinerary_item).permit(:title, :description, :time, :date, :location, :trip_id)
    end

    def create_single
      @itinerary_item = ItineraryItem.new(itinerary_item_single_params)
      if @itinerary_item.save
        render json: @itinerary_item, status: :created
      else
        render json: @itinerary_item.errors, status: :unprocessable_entity
      end
    end

    def create_multiple
      items_params = params.require(:itinerary_items).map do |item_params|
        item_params.permit(:title, :description, :time, :date, :location, :trip_id)
      end

      ActiveRecord::Base.transaction do
        items_params = params.require(:itinerary_items).map do |item|
          item.permit(:title, :description, :time, :date, :location, :trip_id)
        end

        @itinerary_items = ItineraryItem.create!(items_params)
      end

      if @itinerary_items.all?(&:persisted?)
        render json: @itinerary_items, status: :created
      else
        render json: { errors: "Some items failed to save." }, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordInvalid => e
      render json: { errors: e.message }, status: :unprocessable_entity
    end

    def itinerary_item_single_params
      params.require(:itinerary_item).permit(:title, :description, :time, :date, :location, :trip_id)
    end


end
