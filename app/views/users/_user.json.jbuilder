json.extract! user, :id, :name, :email, :address, :company_name, :cnpj, :phone, :role, :created_at, :updated_at
json.url user_url(user, format: :json)
