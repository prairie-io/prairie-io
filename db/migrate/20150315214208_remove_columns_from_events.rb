class RemoveColumnsFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :name, :string
    remove_column :events, :description, :string
  end
end
