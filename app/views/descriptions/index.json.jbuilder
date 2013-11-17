json.array!(@descriptions) do |description|
  json.extract! description, :title, :content
  json.url description_url(description, format: :json)
end
