class HighScore < ActiveRecord::Base
  validates :score, presence: true, numericality: { greater_than: 11 }

  def complete?
    true
  end

  def play_with_collection_of_scores
    scores = [1, 3, 5, 66]
    scores.sum()
  end

  def play_with_collection_of_scores_2
    scores_collection = Array.new(3, ScoreCollection.new)
    scores_collection.sum(&:score) # should return 3
  end

  class ScoreCollection
    def score
      1
    end
  end
end
