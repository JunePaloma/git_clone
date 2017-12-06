require 'rails_helper'

describe "As a logged-in user I can" do
  it "see basic information about my account"

    visit root_path
    mock_auth_hash
    click_on("Sign in with Github")
    visit github_user_index_path

    VCR.cassette("Github_service#basic_user_info")

    expect(page).to have_content("Stars 1")
    expect(page).to have_content("Followers 2")
    expect(page).to have_content("Following 4")
    expect(page).to have_content("Repositories 36")

end
