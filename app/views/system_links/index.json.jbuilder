json.array!(@system_links) do |system_link|
  json.extract! system_link, :id, :system_a_id, :system_b_id, :status, :envelope, :name, :description
  json.url system_link_url(system_link, format: :json)
end
