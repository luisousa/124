json.array!(@searches) do |search|
  json.extract! search, :id, :site, :title, :description, :url
  json.url search_url(search, format: :json)
end
