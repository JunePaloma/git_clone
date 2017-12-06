require 'rails_helper'
describe "feature" do

  it "as a user I can authenticate with my github account" do
    visit root_path
    mock_auth_hash
    click_on("Sign in with Github")
    expect(page).to have_content("Hello, JunePaloma")
    # expect(current_path).to eq("/JunePaloma")
  end

end
