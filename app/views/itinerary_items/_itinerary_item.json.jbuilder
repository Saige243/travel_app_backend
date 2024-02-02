json.extract! itinerary_item, :id, :title, :description, :date, :trip_id, :created_at, :updated_at
json.url itinerary_item_url(itinerary_item, format: :json)
