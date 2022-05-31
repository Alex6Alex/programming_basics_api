json.(@current_user, :id, :email, :created_at, :updated_at)
json.token(@current_user.generate_jwt)
