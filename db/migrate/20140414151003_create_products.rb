class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :brand_id
      t.string :collection_year
      t.string :image

      t.timestamps
    end
  end
end
