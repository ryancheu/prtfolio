json.array!(@codes) do |code|
  json.extract! code, :content
  json.url code_url(code, format: :json)
end
