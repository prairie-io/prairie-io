class AddAttachmentToEvents < ActiveRecord::Migration
  def self.up
    add_attachment :events, :logo
  end

  def self.down
    remove_attachment :events, :logo
  end
end
