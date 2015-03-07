class AddDescriptionToOauthApplications < ActiveRecord::Migration
  def change
    add_column :oauth_applications, :description, :string, null: false
  end
end
