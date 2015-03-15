class RemoveLogoFromEvents < ActiveRecord::Migration
  def up
    remove_attachment :events, :logo
  end
end
