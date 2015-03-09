json.array!(@tasks) do |task|
  json.extract! task, :id, :mission_id, :status, :params
  json.url task_url(task, format: :json)
end
