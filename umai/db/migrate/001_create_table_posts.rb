class CreateTablePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
        t.string :title
        t.integer :user_id
        t.text :content
        t.string :author_ip
    end
  end
end