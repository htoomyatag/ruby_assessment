json.extract! book, :id, :title, :total_pages, :isbn, :published_date, :price, :publisher_id, :created_at, :updated_at
json.url book_url(book, format: :json)
