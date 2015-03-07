class AddIsApprovedAndToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :is_approved, :boolean
  end
end
