class ChangeDescriptionToDescriptionHtml < ActiveRecord::Migration
  def change
    rename_column :events, :description, :description_html
  end
end
