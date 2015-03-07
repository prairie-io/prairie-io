class AddYoutubeVideoIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :youtube_video_id, :string
  end
end
