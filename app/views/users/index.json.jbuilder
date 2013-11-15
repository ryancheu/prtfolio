json.array!(@users) do |user|
  json.extract! user, :fullname, :username, :email
  json.url user_url(user, format: :json)
end
