class ItineraryItemsController < ApplicationController
  before_action :set_itinerary_item, only: %i[ show edit update destroy ]

  # GET /itinerary_items or /itinerary_items.json
  def index
    @itinerary_items = ItineraryItem.all
  end

  # GET /itinerary_items/1 or /itinerary_items/1.json
  def show
  end

  # GET /itinerary_items/new
  def new
    @itinerary_item = ItineraryItem.new
  end

  # GET /itinerary_items/1/edit
  def edit
  end

  # POST /itinerary_items or /itinerary_items.json
  def create
    @itinerary_item = ItineraryItem.new(itinerary_item_params)

    respond_to do |format|
      if @itinerary_item.save
        format.html { redirect_to itinerary_item_url(@itinerary_item), notice: "Itinerary item was successfully created." }
        format.json { render :show, status: :created, location: @itinerary_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @itinerary_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /itinerary_items/1 or /itinerary_items/1.json
  def update
    respond_to do |format|
      if @itinerary_item.update(itinerary_item_params)
        format.html { redirect_to itinerary_item_url(@itinerary_item), notice: "Itinerary item was successfully updated." }
        format.json { render :show, status: :ok, location: @itinerary_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @itinerary_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itinerary_items/1 or /itinerary_items/1.json
  def destroy
    @itinerary_item.destroy!

    respond_to do |format|
      format.html { redirect_to itinerary_items_url, notice: "Itinerary item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itinerary_item
      @itinerary_item = ItineraryItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def itinerary_item_params
      params.require(:itinerary_item).permit(:title, :description, :date, :trip_id)
    end
end
