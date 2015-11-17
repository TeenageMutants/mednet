
json.array!(@departments) do |department|
  json.extract! department, :id, :short_name
  # json.title Todolist.find(event.todolist_id).title
  json.id department.id
  json.short_name department.short_name
  # json.fullnam event.ends_at
  # json.color event.color
  json.url department_url(department, format: :html)

end


