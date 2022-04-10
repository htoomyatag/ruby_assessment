class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :total_pages
      t.string :isbn
      t.date :published_date
      t.integer :publisher_id

      t.timestamps
    end
  end
end
