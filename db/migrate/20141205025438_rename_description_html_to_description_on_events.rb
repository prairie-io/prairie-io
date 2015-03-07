class RenameDescriptionHtmlToDescriptionOnEvents < ActiveRecord::Migration
  def change
    rename_column :events, :description_html, :description
  end
end
