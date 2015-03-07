class AddSubscriberIdAndSubscriberTypeToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :subscriber, index: true, polymorphic: true
  end
end
