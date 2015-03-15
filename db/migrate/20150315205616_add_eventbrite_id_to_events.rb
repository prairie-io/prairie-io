class AddEventbriteIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :eventbrite_id, :string
  end
end
