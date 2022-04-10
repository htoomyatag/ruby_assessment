class CreateApiV1Stores < ActiveRecord::Migration[6.1]
  def change
    create_table :api_v1_stores do |t|
      t.string :title
      t.integer :region_id

      t.timestamps
    end
  end
end
