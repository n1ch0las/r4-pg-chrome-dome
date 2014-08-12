json.array!(@permissions) do |permission|
  json.extract! permission, :id, :name, :profile_image_url, :provider, :token, :token_secret, :uid, :user_id
  json.url permission_url(permission, format: :json)
end
