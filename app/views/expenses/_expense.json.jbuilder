json.extract! expense, :id, :item, :amount, :status, :created_at, :updated_at
json.url expense_url(expense, format: :json)
