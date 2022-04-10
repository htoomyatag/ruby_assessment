class CreateTableRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :post_id
      t.integer :rate
    end
  end
end


