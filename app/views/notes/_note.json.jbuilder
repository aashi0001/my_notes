json.extract! note, :id, :title, :etags, :content, :status, :created_at, :updated_at
json.url note_url(note, format: :json)
