json.extract! payment, :id, :software_id, :buyer_id, :price, :purchase_date, :created_at, :updated_at
json.url payment_url(payment, format: :json)
