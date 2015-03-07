class AddLogoToOauthApplications < ActiveRecord::Migration
  def self.up
    add_attachment :oauth_applications, :logo
  end

  def self.down
    remove_attachment :oauth_applications, :logo
  end
end
