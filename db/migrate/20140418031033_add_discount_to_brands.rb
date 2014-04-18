class AddDiscountToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :discount, :string
  end
end
