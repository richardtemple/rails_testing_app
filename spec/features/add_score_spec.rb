require "rails_helper"
describe "adding scores" do
  it "allows a user to create a score" do
    visit new_high_score_path
    fill_in "Game", with: "MyGame"
    fill_in "Score", with: "100"
    click_on("Create High score")
    visit high_scores_path
    expect(page).to have_content("MyGame")
    expect(page).to have_content("100")
  end
end
