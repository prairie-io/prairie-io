class AddIsPublishableToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_publishable, :boolean, default: true
  end
end
