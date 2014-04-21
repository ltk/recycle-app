class AddLabelToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :label, :string
  end
end
