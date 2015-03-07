class RemoveContactMessages < ActiveRecord::Migration
  def change
    drop_table :contact_messages
  end
end
