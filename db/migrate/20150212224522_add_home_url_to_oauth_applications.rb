class AddHomeUrlToOauthApplications < ActiveRecord::Migration
  def change
    add_column :oauth_applications, :home_url, :string, null: false
  end
end
