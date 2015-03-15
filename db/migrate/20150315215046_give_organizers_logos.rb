class GiveOrganizersLogos < ActiveRecord::Migration
  def change
    interface = Organizer.where(name: "Interface Fargo").first_or_create
    interface.logo = File.open(Rails.root.join("app/assets/images/seeds/interfacefargo.jpg"))
    interface.save

    nsfargo = Organizer.where(name: "NSFargo").first_or_create
    nsfargo.logo = File.open(Rails.root.join("app/assets/images/nsfargo.jpg"))
    nsfargo.save
  end
end
