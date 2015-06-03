json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :name, :exchange
  json.url transaction_url(transaction, format: :json)
end
