class CreateGeneres < ActiveRecord::Migration[7.0]
  def change
    create_table :generes do |t|
      t.string :title

      t.timestamps
    end
  end
end
