class AddTrackingToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :tracking, :string
  end
end
