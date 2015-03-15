class AddLogoToOrganizer < ActiveRecord::Migration
  def self.up
    add_attachment :organizers, :logo
  end

  def self.down
    remove_attachment :organizers, :logo
  end
end
