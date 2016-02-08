class AddDefaultValueToUsersCohorts < ActiveRecord::Migration
  def change
    change_column :users, :cohort_id, :integer, default: 4
  end
end
