class AddIsAttendableToEvents < ActiveRecord::Migration
  def change
    add_column :events, :is_attendable, :boolean, default: false
  end
end
