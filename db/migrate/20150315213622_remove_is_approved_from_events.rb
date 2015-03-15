class RemoveIsApprovedFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :is_approved, :boolean
  end
end
