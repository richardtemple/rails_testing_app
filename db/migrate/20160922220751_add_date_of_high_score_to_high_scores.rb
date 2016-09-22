class AddDateOfHighScoreToHighScores < ActiveRecord::Migration
  def change
    add_column :high_scores, :date_of_high_score, :date
  end
end
