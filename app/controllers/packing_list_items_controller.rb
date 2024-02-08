class PackingListItemsController < ApplicationController
  before_action :set_trip
  before_action :set_packing_list_item, only: [:update, :destroy]


  def index
    @trip = Trip.find(params[:trip_id])
    @packing_list_items = @trip.packing_list_items
    render json: @packing_list_items
  end

  def create
    if params[:packing_list_items]
      create_multiple
    else
      create_single
    end
  end

  def update
    if @packing_list_item.update(packing_list_item_params)
      render json: @packing_list_item, status: :ok
    else
      render json: @packing_list_item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @packing_list_item.destroy
    render json: { message: "Item successfully deleted." }, status: :ok
  end

  private

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def set_packing_list_item
    @packing_list_item = @trip.packing_list_items.find(params[:id])
  end

  def packing_list_item_params
    params.require(:packing_list_item).permit(:category, :description, :packed)
  end

  # Handles creating a single packing list item
  def create_single
    @packing_list_item = @trip.packing_list_items.build(packing_list_item_params)
    if @packing_list_item.save
      render json: @packing_list_item, status: :created
    else
      render json: @packing_list_item.errors, status: :unprocessable_entity
    end
  end

  # Handles creating multiple packing list items
  def create_multiple
    items_params = params.require(:packing_list_items).map do |item|
      item.permit(:category, :description).merge(trip_id: @trip.id)
    end

    @packing_list_items = PackingListItem.create(items_params)

    if @packing_list_items.all?(&:persisted?)
      render json: @packing_list_items, status: :created
    else
      # Simplified error handling; you might want to aggregate or detail errors
      render json: { errors: "Some items failed to save." }, status: :unprocessable_entity
    end
  end
end
