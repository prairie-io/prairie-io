class AddHexToUsers < ActiveRecord::Migration
  def change
    add_column :users, :hex, :text
  end
end
