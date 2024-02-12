class AddTimeToItineraryItems < ActiveRecord::Migration[7.1]
  def change
    add_column :itinerary_items, :time, :time
  end
end
