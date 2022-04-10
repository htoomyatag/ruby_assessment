class CreateTableFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks do |t|
      t.integer :user_id
      t.integer :post_id
      t.text :owner_comment
      t.integer :owner_id
    end
  end
end


