json.extract! user, :id, :email, :password, :facebook_account, :created_at, :updated_at
json.url user_url(user, format: :json)