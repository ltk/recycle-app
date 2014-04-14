class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.integer :user_id
      t.integer :brand_id
      t.integer :product_id

      t.timestamps
    end
  end
end
