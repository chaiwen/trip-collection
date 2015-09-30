json.array!(@activities) do |activity|
  json.extract! activity, :id, :name, :address, :city, :country, :lat, :lng, :days, :hrs, :rating, :description, :cost, :date
  json.url activity_url(activity, format: :json)
end
