json.array!(@templates) do |template|
  json.extract! template, 
  json.url template_url(template, format: :json)
end
