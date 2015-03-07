class ChangeSubscriberIdAndTypeToSponsorOnEvents < ActiveRecord::Migration
  def change
    rename_column :events, :subscriber_id, :sponsor_id
    rename_column :events, :subscriber_type, :sponsor_type
  end
end
