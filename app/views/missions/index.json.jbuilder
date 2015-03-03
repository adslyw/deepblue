json.array!(@missions) do |mission|
  json.extract! mission, :id, :description, :sql, :params, :sql_type, :multiple
  json.url mission_url(mission, format: :json)
end
