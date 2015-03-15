class AddBufferAccessTokenToOrganizers < ActiveRecord::Migration
  def change
    add_column :organizers, :buffer_key, :string
  end
end
