json.extract! trip, :id, :title, :description, :user_id, :created_at, :updated_at
json.url trip_url(trip, format: :json)
