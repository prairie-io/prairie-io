class AddIsApprovedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_approved, :boolean, default: false
  end
end
