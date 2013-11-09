json.array!(@posts) do |post|
  json.extract! post, :flight_id, :user_id, :description, :weight
  json.url post_url(post, format: :json)
end
