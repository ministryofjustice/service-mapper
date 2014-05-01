json.array!(@contracts) do |contract|
  json.extract! contract, :id, :annual_cost, :start_date, :expiry_date, :renewable, :supplier, :owner, :owner_email, :desc
  json.url contract_url(contract, format: :json)
end
