class AddRegionToProducts < ActiveRecord::Migration[6.1]
  def change
      add_column :api_v1_products, :region_id, :integer
  end
end
