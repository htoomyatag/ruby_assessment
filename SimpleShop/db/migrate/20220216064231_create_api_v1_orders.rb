class CreateApiV1Orders < ActiveRecord::Migration[6.1]
  def change
    create_table :api_v1_orders do |t|
      t.string :first_name
      t.string :last_name
      t.text :shipping_address
      t.decimal :order_total
      t.datetime :paid_at
      t.string :payment_status, :default => "unpaid"

      t.timestamps
    end
  end
end
