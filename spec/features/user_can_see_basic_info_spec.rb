require 'rails_helper'

describe "As a logged-in user I can" do
  it "see basic information about my account" do
    VCR.use_cassette("Github_service#basic_user_info") do
    visit "/"
    mock_auth_hash
    click_on("Sign in with Github")
    # expect(current_path).to eq(github_user_path)

    expect(page).to have_content("Stars 1")
    expect(page).to have_content("Followers 2")
    expect(page).to have_content("Following 4")
    expect(page).to have_content("Repositories 36")
    end
  end
end
