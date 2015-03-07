class AddIsPublishableToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :is_publishable, :boolean, default: true
  end
end
