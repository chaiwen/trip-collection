json.array!(@trips) do |trip|
  json.extract! trip, :id, :title, :rating, :description, :date
  json.url trip_url(trip, format: :json)
end
