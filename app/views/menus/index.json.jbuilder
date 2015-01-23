json.array!(@menus) do |menu|
  json.extract! menu, :id, :title, :icon, :url, :parent_id
  json.url menu_url(menu, format: :json)
end
