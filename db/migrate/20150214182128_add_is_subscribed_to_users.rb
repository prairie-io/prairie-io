class AddIsSubscribedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_subscribed, :boolean, default: true, null: false
  end
end
