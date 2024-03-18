class AddDatetimeToItineraryItems < ActiveRecord::Migration[7.1]
  def change
    add_column :itinerary_items, :datetime, :datetime
  end
end
