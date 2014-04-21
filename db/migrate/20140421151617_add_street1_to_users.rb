class AddStreet1ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :street1, :string
    add_column :users, :string, :string
  end
end
