json.extract! inbox, :id, :name, :remote_folder, :service, :created_at, :updated_at
json.url inbox_url(inbox, format: :json)