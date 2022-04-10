json.extract! review, :id, :title, :description, :rate, :user_id, :book_id, :created_at, :updated_at
json.url review_url(review, format: :json)
