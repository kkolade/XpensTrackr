json.extract! item, :id, :name, :amount, :author_id, :bill_id, :created_at, :updated_at
json.url item_url(item, format: :json)
