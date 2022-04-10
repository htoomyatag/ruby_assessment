class CreateApiV1Countries < ActiveRecord::Migration[6.1]
  def change
    create_table :api_v1_countries do |t|
      t.string :title
      t.string :country_code

      t.timestamps
    end
  end
end
