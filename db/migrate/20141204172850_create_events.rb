class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :description_html
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zipcode
      t.float :latitude
      t.float :longitude
      t.string :time_zone, default: "GMT"
      t.datetime :starts_at
      t.datetime :ends_at
      t.text :location_description

      t.timestamps null: false
    end
  end
end
