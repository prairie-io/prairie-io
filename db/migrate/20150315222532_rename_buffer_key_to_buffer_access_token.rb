class RenameBufferKeyToBufferAccessToken < ActiveRecord::Migration
  def change
    rename_column :organizers, :buffer_key, :buffer_access_token
  end
end
