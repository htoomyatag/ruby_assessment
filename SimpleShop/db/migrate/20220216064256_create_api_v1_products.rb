class CreateApiV1Products < ActiveRecord::Migration[6.1]
  def change
    create_table :api_v1_products do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.decimal :price
      t.string :sku
      t.integer :stock

      t.timestamps
    end
  end
end
