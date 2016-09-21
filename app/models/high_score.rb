class HighScore < ActiveRecord::Base
  validates :score, presence: true, numericality: { greater_than: 11 }

  def complete?
    true
  end
end
