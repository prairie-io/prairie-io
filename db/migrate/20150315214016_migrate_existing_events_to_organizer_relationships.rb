class MigrateExistingEventsToOrganizerRelationships < ActiveRecord::Migration
  def change
    Event.all.each do |event|
      organizer = Organizer.where(
        name: event.name,
        description: event.description
      ).first_or_create

      organizer.events << event
    end
  end
end
