json.array!(@assets) do |asset|
  json.extract! asset, :id, :user_id, :attachment_file_name
  json.url asset_url(asset, format: :json)
end
