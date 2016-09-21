require 'rails_helper'

RSpec.describe HighScore, type: :model do
  it "is able to create an instance" do
    high_score = HighScore.new
    expect(high_score).to not_be_nil
  end
end
