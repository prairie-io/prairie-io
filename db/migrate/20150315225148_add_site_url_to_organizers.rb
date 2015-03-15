class AddSiteUrlToOrganizers < ActiveRecord::Migration
  def change
    add_column :organizers, :site_url, :string
  end
end
