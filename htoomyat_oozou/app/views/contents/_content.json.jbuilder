json.extract! content, :id, :title, :published_date, :author, :summary, :content, :status, :created_at, :updated_at
json.url content_url(content, format: :json)
