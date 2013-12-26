json.array!(@line_items) do |line_item|
  json.extract! line_item, :table_id, :working_change, :belongs_to
  json.url line_item_url(line_item, format: :json)
end