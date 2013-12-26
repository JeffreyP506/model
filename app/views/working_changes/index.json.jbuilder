json.array!(@working_changes) do |working_change|
  json.extract! working_change, 
  json.url working_change_url(working_change, format: :json)
end