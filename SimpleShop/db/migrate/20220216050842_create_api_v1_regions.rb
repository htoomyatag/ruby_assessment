class CreateApiV1Regions < ActiveRecord::Migration[6.1]
  def change
    create_table :api_v1_regions do |t|
      t.string :title
      t.integer :country_id
      t.integer :currency_id
      t.integer :tax_id

      t.timestamps
    end
  end
end
