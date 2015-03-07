class RemoveIsPublishableFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :is_publishable, :boolean, default: true
  end
end
