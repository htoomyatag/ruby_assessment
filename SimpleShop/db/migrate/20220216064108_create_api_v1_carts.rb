class CreateApiV1Carts < ActiveRecord::Migration[6.1]
  def change
    create_table :api_v1_carts do |t|

      t.timestamps
    end
  end
end
