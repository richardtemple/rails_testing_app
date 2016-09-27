require 'rails_helper'

RSpec.describe HighScore, type: :model do
  let(:empty_high_score) {HighScore.new}
  let(:valid_high_score) {HighScore.new({game: "big game", score: 44})}

  before(:example) do
    valid_high_score.level = 10
  end

  it "is able to create an instance" do
    expect(empty_high_score).to_not be_nil
    expect(empty_high_score.level).to eq(nil)
  end

  it "will fail on save with empty values" do
    expect {empty_high_score.save!}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "will save with valid data" do
    valid_high_score.save!
    loaded_score = HighScore.find(valid_high_score.id)
    expect(valid_high_score.score).to eq(44)
    expect(valid_high_score.level).to eq(10)
  end

  it "will allow for compound matchers" do
    expect([valid_high_score.game, valid_high_score.score])
      .to contain_exactly("big game", 44)
  end

  it "will reset with each it method when changing values on a let" do
    valid_high_score.score = 77
    expect(valid_high_score.score).to eq(77)
  end

  it "doesnt fail even though set to 77 in different test" do
    expect(valid_high_score.score).to eq(44)
  end

  it "uses be_ to check for booleans" do
    expect(valid_high_score).to be_complete
  end

  it "stores the date of high score correctly" do
    valid_high_score.date_of_high_score = 1.day.ago
    expect(valid_high_score.date_of_high_score).to be_within(2.days).of(Date.today)
  end

  it "will sum a bogus collection of scores" do
    expect(valid_high_score.play_with_collection_of_scores).to eq(75)
  end
  it "will sum a bogus collection of scores 2" do
    expect(valid_high_score.play_with_collection_of_scores_2).to eq(3)
  end
end
