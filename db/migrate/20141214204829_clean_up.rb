class CleanUp < ActiveRecord::Migration
  def change
    drop_table :organizations
    drop_table :organization_memberships
    remove_reference :events, :sponsor, polymorphic: true

  end
end
