class AddStatusToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :status, :integer, default: 1
  end
end
