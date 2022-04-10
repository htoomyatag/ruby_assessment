class CreateBooksGeneresJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :books, :generes do |t|
      t.index :book_id
      t.index :genere_id
    end
  end
end
