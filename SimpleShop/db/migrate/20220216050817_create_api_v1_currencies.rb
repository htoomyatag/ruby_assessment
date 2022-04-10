class CreateApiV1Currencies < ActiveRecord::Migration[6.1]
  def change
    create_table :api_v1_currencies do |t|
      t.string :title
      t.string :currency_code

      t.timestamps
    end
  end
end
