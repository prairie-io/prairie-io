class RemoveMerit < ActiveRecord::Migration
  def change
    drop_table :badges_sashes
    drop_table :merit_actions
    drop_table :merit_activity_logs
    drop_table :merit_score_points
    drop_table :merit_scores
    drop_table :sashes
  end
end
