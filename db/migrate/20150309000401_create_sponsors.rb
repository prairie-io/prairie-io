class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :name, null: false
      t.text :description_html, null: false
      t.string :url, null: false
      t.attachment :logo

      t.timestamps null: false
    end
  end
end
