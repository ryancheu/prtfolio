json.array!(@themes) do |theme|
  json.extract! theme, 
  json.url theme_url(theme, format: :json)
end
