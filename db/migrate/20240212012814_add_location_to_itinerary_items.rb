class AddLocationToItineraryItems < ActiveRecord::Migration[7.1]
  def change
    add_column :itinerary_items, :location, :string
  end
end
