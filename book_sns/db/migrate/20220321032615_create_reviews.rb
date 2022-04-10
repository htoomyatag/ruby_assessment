class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :description
      t.integer :rate
      t.integer :user_id
      t.integer :book_id

      t.timestamps
    end
  end
end
