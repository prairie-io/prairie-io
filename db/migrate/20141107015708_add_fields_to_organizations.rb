class AddFieldsToOrganizations < ActiveRecord::Migration
  def self.up
    add_column :organizations, :sash_id, :integer
    add_column :organizations, :level, :integer, :default => 0
  end

  def self.down
    remove_column :organizations, :sash_id
    remove_column :organizations, :level
  end
end
