json.array!(@photos) do |photo|
  json.extract! photo, :id, :URL, :caption, :date, :rating, :photoable_id, :photoable_type
  json.url photo_url(photo, format: :json)
end
