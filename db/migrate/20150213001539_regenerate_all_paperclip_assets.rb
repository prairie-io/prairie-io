class RegenerateAllPaperclipAssets < ActiveRecord::Migration
  def change
    `rake paperclip:refresh CLASS=User`
    `rake paperclip:refresh CLASS=Event`
    `rake paperclip:refresh CLASS=Doorkeeper::Application`
  end
end
