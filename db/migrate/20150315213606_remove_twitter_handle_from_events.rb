class RemoveTwitterHandleFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :twitter_handle, :string
  end
end
